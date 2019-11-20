@test "Test that we can get K8s nodes" {
    run kubectl get nodes
    [ $status = 0 ]
}