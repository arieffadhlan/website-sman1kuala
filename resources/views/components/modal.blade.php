<div class="fixed z-50 inset-0 invisible overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true" @if ($modalTitle == 'Hapus Data') id="modalDelete{{ $id }}" @elseif ($modalTitle == 'Keluar Dashboard') id="modalLogout" @else id="modal" @endif>
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition" aria-hidden="true"></div>
            <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">​</span>
            <div class="inline-block align-middle bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                    <div class="sm:flex sm:items-start">
                        <div class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
                            <svg @click="toggleModal" class="h-6 w-6 text-red-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                            </svg>
                        </div>
                        <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                            <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">
                                {{ $modalTitle }}
                            </h3>
                        <div class="mt-2">
                            <p class="text-sm text-gray-500">
                                {{ $slot }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="px-4 py-3 bg-gray-50 sm:px-6">
                @if ($modalTitle == 'Hapus Data' || $modalTitle == 'Keluar Dashboard')  
                    @if ($modalTitle == 'Hapus Data')
                        <form action="{{ $route }}" method="post">
                            @csrf
                            @method('delete')
                    @else
                        <form action="{{ route('logout') }}" method="post">
                            @csrf
                    @endif
                        <div class="flex flex-col-reverse gap-y-3 sm:flex-row sm:justify-between sm:gap-y-0">
                            <button type="button" class="@if ($modalTitle == 'Hapus Data') closeModal{{ $id }}  @elseif ($modalTitle == 'Keluar Dashboard') closeModalLogout @else closeModal @endif inline-flex justify-center px-5 py-2 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-gray-300 font-semibold text-primary transition duration-250 ease-in-out hover:ring-2 hover:ring-offset-2 hover:ring-gray-300 hover:bg-gray-400/50 active:bg-gray-500/50 disabled:opacity-25">
                                Batal
                            </button>
                            <button type="submit" class="inline-flex justify-center px-5 py-2 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-red-600 font-semibold text-white transition duration-250 ease-in-out hover:ring-2 hover:ring-offset-2 hover:ring-red-500 hover:bg-red-700 active:bg-red-800 disabled:opacity-25">
                                Yakin
                            </button>
                        </div>
                    </form>
                @else
                    <div class="flex flex-col-reverse gap-y-3 sm:flex-row sm:justify-between sm:gap-y-0">
                        <button type="button" class="closeModal inline-flex justify-center px-5 py-2 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-gray-300 font-semibold text-primary transition duration-250 ease-in-out hover:ring-2 hover:ring-offset-2 hover:ring-gray-300 hover:bg-gray-400/50 active:bg-gray-500/50 disabled:opacity-25">
                            Batal
                        </button>
                        <button type="submit" class="inline-flex justify-center px-5 py-2 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-red-600 font-semibold text-white transition duration-250 ease-in-out hover:ring-2 hover:ring-offset-2 hover:ring-red-500 hover:bg-red-700 active:bg-red-800 disabled:opacity-25">
                            Kirim
                        </button>
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>

@if ($modalTitle == 'Hapus Data')
    @push('scripts')
        <script>
            $(document).ready(function () {
                let modalDeleteId = '#modalDelete'.concat({{ $id }});
                let openModalId = '.openModal'.concat({{ $id }});
                let closeModalId = '.closeModal'.concat({{ $id }});
                $(`${openModalId}`).on('click', function(e){
                    $(`${modalDeleteId}`).removeClass('invisible');
                });
                $(`${closeModalId}`).on('click', function(e){
                    $(`${modalDeleteId}`).addClass('invisible');
                });
            });
        </script>
    @endpush
@elseif ($modalTitle == 'Keluar Dashboard')
    @push('scripts')
        <script>
            $(document).ready(function () {
                $('.openModalLogout').on('click', function(e){
                    $('#modalLogout').removeClass('invisible');
                });
                $('.closeModalLogout').on('click', function(e){
                    $('#modalLogout').addClass('invisible');
                });
            });
        </script>
    @endpush
@else
    @push('scripts')
        <script>
            $(document).ready(function () {
                $('.openModal').on('click', function(e){
                    $('#modal').removeClass('invisible');
                });
                $('.closeModal').on('click', function(e){
                    $('#modal').addClass('invisible');
                });
            });
        </script>
    @endpush
@endif