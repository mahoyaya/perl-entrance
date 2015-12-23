#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

my $height = 0;
get '/' => sub {
  my $c = shift;
  $c->stash(height => $height);
  $c->render(template => 'perl-entrance');
};

get '/post' => sub {
  my $self = shift;
  $height = $self->param('height');
  $self->stash(height => $height);
  $self->redirect_to('/');
};

post '/post' => sub {
  my $self = shift;
  $height = $self->param('height');
  $self->stash(height => $height);
  $self->redirect_to('/');
};


app->start;
__DATA__

@@ index.html.ep
% layout 'bootstrap';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
To learn more, you can browse through the documentation
<%= link_to 'here' => '/perldoc' %>.

%= submit_button '投稿する', class => 'btn btn-default'
<div class="container">
  <div class='table-responsive'>
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>message</th>
        </tr>
      </thead>
      <tbody>
        <tr class='info' >
          <td>1</td>
          <td>message1</td>
        </tr>
        <tr class='warning' >
          <td>2</td>
          <td>message2</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>


@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
