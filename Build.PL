use strict;
use warnings;
use Module::Build;
use Alien::FFCall;

# Retrieve the Alien::FFCall configuration:
my $alien = Alien::FFCall->new;

# Add the WIN32 compiler flag, as appropriate
my $compiler_flags = $alien->cflags();
$compiler_flags .= ' -DWIN32' if $^O eq "MSWin32";
print "Compiler flags are $compiler_flags\n";

# Add the specific libraries against which to link
my $linker_flags = $alien->libs();
$linker_flags .= ' -lavcall -lcallback';
print "Linker flags are $linker_flags\n";

# Create the build script:
my $builder = Module::Build->new(
	module_name => 'FFI',
	extra_compiler_flags => $compiler_flags,
	extra_linker_flags => $linker_flags,
	configure_requires => {
		'Alien::FFCall' => 0,
	},
);
$builder->create_build_script;
