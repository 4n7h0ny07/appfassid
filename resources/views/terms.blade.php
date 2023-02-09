<x-app-layout>
    <x-guest-layout>
        <div class="pt-4 bg-gray-100">
            <div class="min-h-screen flex flex-col items-center pt-6 sm:pt-0">
                <div>
                    <picture class="py-8">
                        <img src="{{ Voyager::image(setting('site.logo')) }}" alt="Logo Aqui" width="350" srcset="">
                    </picture>
                </div>

                <div class="w-full sm:max-w-8xl mt-8 p-8 bg-dark shadow-md overflow-hidden sm:rounded-lg prose">
                    {!! setting('site.garantia') !!}
                </div>
            </div>
            <div>
                
            </div>
        </div>
    </x-guest-layout>
</x-app-layout>
