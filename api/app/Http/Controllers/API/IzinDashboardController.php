<?php

namespace App\Http\Controllers\API\Manager\Dashboard;

use App\Exports\ApprovedLettersExport;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Utils\ResponseWrapper;
use App\Models\Department;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Izin;
use Carbon\Carbon;

class ManagerDashboardController extends Controller
{
    public function __invoke(Request $request)
    {
        try {
            $month = $request->input('month');

            // Query for approved + rejected + pending
            $approvedQuery = Izin::where('status', 'approved');
            $rejectedQuery = Izin::where('status', 'rejected');
            $pendingQuery = Izin::where('status', 'pending');

            if ($month) {
                $approvedQuery->whereMonth('created_at', $month);
                $rejectedQuery->whereMonth('created_at', $month);
                $pendingQuery->whereMonth('created_at', $month);
            }

            $approvedCount = $approvedQuery->count();
            $rejectedCount = $rejectedQuery->count();
            $pendingCount = $pendingQuery->count();

            // Total approved today
            $totalApprovedToday = Izin::where('status', 'approved')
                ->whereDate('created_at', Carbon::today())
                ->count();

            // Department overview
            $departments = Department::withCount([
                'izins as approved_izins_count' => function ($query) use ($month) {
                    $query->where('status', 'approved');
                    if ($month) {
                        $query->whereMonth('created_at', $month);
                    }
                },
                'izins as rejected_izins_count' => function ($query) use ($month) {
                    $query->where('status', 'rejected');
                    if ($month) {
                        $query->whereMonth('created_at', $month);
                    }
                },
                'izins as pending_izins_count' => function ($query) use ($month) {
                    $query->where('status', 'pending');
                    if ($month) {
                        $query->whereMonth('created_at', $month);
                    }
                },
            ])->get();

            return ResponseWrapper::success([
                "approved_letters" => $approvedCount,
                "rejected_letters" => $rejectedCount,
                "pending_letters" => $pendingCount,
                "total_approved_today" => $totalApprovedToday,
                "department_overview" => $departments,
            ]);
        } catch (\Throwable $th) {
            return ResponseWrapper::fail($th->getMessage(), 500);
        }
    }

    public function exportApprovedLetters(Request $request)
    {
        try {
            $month = $request->input('month');

            $query = Izin::where('status', 'approved');
            if ($month) {
                $query->whereMonth('created_at', $month);
            }

            $data = $query->get();

            return Excel::download(new ApprovedLettersExport($data), 'approved_letters.xlsx');
        } catch (\Throwable $th) {
            return ResponseWrapper::fail($th->getMessage(), 500);
        }
    }
}
