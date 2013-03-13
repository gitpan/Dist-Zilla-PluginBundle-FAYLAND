
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
    "Dist::Zilla" => "4.300028",
    "Dist::Zilla::Plugin::CheckChangeLog" => "0.01",
    "Dist::Zilla::Plugin::ContributorsFromGit" => "0.004",
    "Dist::Zilla::Plugin::PerlTidy" => "0.06",
    "Dist::Zilla::Plugin::PodWeaver" => "3.092971",
    "Dist::Zilla::Plugin::ReadmeFromPod" => "0.03",
    "Dist::Zilla::Plugin::Repository" => "0.08",
    "Dist::Zilla::Plugin::Test::Compile" => "0.05"
  },
  "VERSION" => "0.11",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



