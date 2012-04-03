use strict;
use warnings;
use Module::Build;
use Alien::FFCall;

my @compiler_flags = @{$alien->cflags()};
push @compiler_flags, '-DWIN32' if $^O eq "MSWin32";

my $alien = Alien::FFCall->new;
my $builder = Module::Build->new({
	extra_compiler_flags => \@compiler_flags,
	extra_linker_flags => $alien->libs(),
	configure_requires => {
		Alien::FFCall => 0,
	},
	module_name => 'FFI',
});
