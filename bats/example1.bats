@test "Check that we have a /tmp directory" {
	run stat /tmp
	[ $status = 0 ]
}

@test "Check that we can reach www.example.org" {
    run curl -s \
    -o /dev/null \
    --max-time 10 \
    --retry 5 \
    --retry-delay 0 \
    --retry-max-time 40 \
    -w \%{http_code}\ \
    http://www.example.org/
	[ $output = 200 ]
}

@test "Test that we get the word 'bar'" {
    run bash -c "echo 'foo bar baz' | cut -d' ' -f2"
    [ $output = bar ]
}

@test "Test that we get the word 'Tomas'" {
    run bash -c "echo 'Team' | grep Tomas"
    [ $status = 0 ]
}