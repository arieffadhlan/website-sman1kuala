<x-app-layout>
	<div class="w-full mb-4">
		<div class="flex justify-center flex-wrap gap-6 sm:justify-start">
			<x-dashboard.statistic-card :counts="$classes">
				<x-slot:icon><i class="fas fa-school"></i></x-slot:icon>
				Kelas
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$fieldsOfStudy">
				<x-slot:icon><i class="fas fa-book"></i></x-slot:icon>
				Bidang Studi
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$teachers">
				<x-slot:icon><i class="fas fa-chalkboard-teacher"></i></x-slot:icon>
				Guru
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$students">
				<x-slot:icon><i class="fas fa-user-graduate"></i></x-slot:icon>
				Siswa
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$staffs">
				<x-slot:icon><i class="fas fa-user-tie"></i></x-slot:icon>
				Pegawai
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$achievements">
				<x-slot:icon><i class="fas fa-star"></i></x-slot:icon>
				Prestasi
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$facilities">
				<x-slot:icon><i class="fas fa-building"></i></x-slot:icon>
				Fasilitas
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$extracurriculars">
				<x-slot:icon><i class="fas fa-futbol"></i></x-slot:icon>
				Ekstrakurikuler
			</x-dashboard.statistic-card>
			<x-dashboard.statistic-card :counts="$accounts">
				<x-slot:icon><i class="fas fa-users"></i></x-slot:icon>
				Akun
			</x-dashboard.statistic-card>
		</div>
	</div>
</x-app-layout>
