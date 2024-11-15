<?php

namespace App\Http\Livewire\Profile;

use App\Models\Version;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Livewire\Component;

class License extends Component
{
    public $endpoint;

    public $version;

    public $license;

    public $plan;

    public function mount()
    {
        $this->endpoint = 'https://www.mageni.net/api/v1/token/plan';

        $this->version = Version::select('api_key')->find(1);
        $this->license = $this->version->api_key;

        $response = Http::withToken($this->version->api_key)->get($this->endpoint);

        if (Str::contains($response, 'paid')) {
            $this->plan = 'Paid';
            Log::info('You are on the paid plan.');
        } else {
            $this->plan = 'Free';
            Log::info('You are on the free plan.');
        }
    }

    public function setLicense()
    {
        $this->validate([
            'license' => 'required',
        ]);

        Version::where('id', 1)->update(['api_key' => $this->license]);

        return redirect()->to('/user/profile');
    }

    public function render()
    {
        return view('profile.license');
    }
}
