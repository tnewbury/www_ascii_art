  #!/usr/bin/perl
    use HTTP::Lite;
    $http = HTTP::Lite->new;
    $req = $http->request("http://www.cpan.org/") 
        or die "Unable to get document: $!";
    print $http->body();
