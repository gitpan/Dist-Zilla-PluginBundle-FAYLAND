
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Dist::Zilla like FAYLAND when you build your dists",
  "AUTHOR" => "Fayland Lam <fayland\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-PluginBundle-FAYLAND",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::PluginBundle::FAYLAND",
  "PREREQ_PM" => {
    "Dist::Zilla" => 5,
    "Dist::Zilla::Plugin::CheckChangeLog" => "0.01",
    "Dist::Zilla::Plugin::ContributorsFromGit" => "0.004",
    "Dist::Zilla::Plugin::PerlTidy" => "0.06",
    "Dist::Zilla::Plugin::PodWeaver" => "3.092971",
    "Dist::Zilla::Plugin::ReadmeFromPod" => "0.20",
    "Dist::Zilla::Plugin::Repository" => "0.08",
    "Dist::Zilla::Plugin::Test::Compile" => "0.05"
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.12",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Dist::Zilla" => 5,
  "Dist::Zilla::Plugin::CheckChangeLog" => "0.01",
  "Dist::Zilla::Plugin::ContributorsFromGit" => "0.004",
  "Dist::Zilla::Plugin::PerlTidy" => "0.06",
  "Dist::Zilla::Plugin::PodWeaver" => "3.092971",
  "Dist::Zilla::Plugin::ReadmeFromPod" => "0.20",
  "Dist::Zilla::Plugin::Repository" => "0.08",
  "Dist::Zilla::Plugin::Test::Compile" => "0.05",
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Test::More" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



