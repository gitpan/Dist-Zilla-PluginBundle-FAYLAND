package Dist::Zilla::PluginBundle::FAYLAND;
our $VERSION = '0.01';

# ABSTRACT: Dist::Zilla like FAYLAND when you build your dists

use Moose;
use Moose::Autobox;
with 'Dist::Zilla::Role::PluginBundle';

use Dist::Zilla::PluginBundle::Filter;

sub bundle_config {
    my ( $self, $arg ) = @_;
    my $class = ( ref $self ) || $self;

    my @plugins = Dist::Zilla::PluginBundle::Filter->bundle_config(
        {
            bundle => '@Classic',
            remove => [qw(PodVersion BumpVersion)],
        }
    );

    push @plugins,
      (
        [ 'Dist::Zilla::Plugin::PodWeaver'      => {} ],
        [ 'Dist::Zilla::Plugin::PerlTidy'       => {} ],
        [ 'Dist::Zilla::Plugin::Repository'     => {} ],
        [ 'Dist::Zilla::Plugin::ReadmeFromPod'  => {} ],
        [ 'Dist::Zilla::Plugin::CheckChangeLog' => {} ],
      );

    eval "require $_->[0]" or die for @plugins;    ## no critic Carp

    @plugins->map( sub { $_->[1]{'=name'} = "$class/$_->[0]" } );

    return @plugins;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=head1 NAME

Dist::Zilla::PluginBundle::FAYLAND - Dist::Zilla like FAYLAND when you build your dists

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    # dist.ini
    [@FAYLAND]

It is equivalent to:

    [@Filter]
    bundle = @Classic
    remove = PodVersion
    remove = BumpVersion

    [PodWeaver]
    [PerlTidy]
    [Repository]
    [ReadmeFromPod]
    [CheckChangeLog]

=head1 AUTHOR

  Fayland Lam <fayland@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Fayland Lam.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.
