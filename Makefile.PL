
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-PluginBundle-FAYLAND',
  NAME      => 'Dist::Zilla::PluginBundle::FAYLAND',
  AUTHOR    => 'Fayland\ Lam\ \<fayland\@gmail\.com\>',
  ABSTRACT  => 'Dist::Zilla like FAYLAND when you build your dists',
  VERSION   => '0.01',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Dist::Zilla::Plugin::PodWeaver" => '2.000',
    "Dist::Zilla::Plugin::ReadmeFromPod" => '0.03',
    "Dist::Zilla" => '1.091370',
    "Dist::Zilla::Plugin::CheckChangeLog" => '0.01',
    "Dist::Zilla::Plugin::Repository" => '0.08',
    "Dist::Zilla::Plugin::PerlTidy" => '0.04',
  },
);
