<?php

namespace App\Http\Livewire;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Livewire\Component;

class Reports extends Component
{
    use AuthorizesRequests;

    public function vulnReport()
    {
        return redirect()->to('/reports/vulnerabilities');
    }

    public function render()
    {
        return view('livewire.reports');
    }
}
