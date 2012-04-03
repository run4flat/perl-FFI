use strict;
use warnings;
use Module::Build;
use Alien::FFCall;

# Retrieve the Alien::FFCall configuration:
my $alien = Alien::FFCall->new;

# Add the WIN32 compiler flag, as appropriate
my $compiler_flags = $alien->cflags();
print "Compiler flags are $compiler_flags\n";
print "Linker flags are ", $alien->libs(), "\n";
$compiler_flags = [$compiler_flags] unless ref $compiler_flags;
push (@$compiler_flags, '-DWIN32') if $^O eq "MSWin32";

# Create the build script:
my $builder = Module::Build->new(
	module_name => 'FFI',
	extra_compiler_flags => $compiler_flags,
	extra_linker_flags => $alien->libs(),
	configure_requires => {
		'Alien::FFCall' => 0,
	},
);
$builder->create_build_script;
