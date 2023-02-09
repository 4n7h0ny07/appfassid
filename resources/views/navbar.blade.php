<nav class="px-2 bg-white border-gray-200 dark:bg-gray-900 py-2.5 dark:border-gray-900" x-data="{open:false}">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-wrap items-center justify-between">
        <a href="#" class="flex items-center">
            <img src="{{ Voyager::image(setting('site.logo')) }}" class="h-6 mr-3 sm:h-10" alt="Flowbite Logo" />
            <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">{{setting('site.title')}}</span>
        </a>
        <button @click="open = !open" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-dropdown" aria-expanded="false">
            <span class="sr-only">Open main menu</span>
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
        </button>
        <div :class="{ 'hidden' : !open,}"class="hidden w-full md:block md:w-auto" id="navbar-dropdown">
            <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                @foreach ($items AS $item)
                    <li>
                        <x-nav-link :href="$item->link()" :active="request()->routeIs($item->route)">

                            {{ $item->title }}

                        </x-nav-link>
                    </li>
                @endforeach

            </ul>
        </div>
        </div>
    </div>
  </nav>
  