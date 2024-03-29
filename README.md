# sonobuoy-bats
Example of running [Bats](https://github.com/bats-core/bats-core) (TAP-compliant testing framework for Bash) in [Sonobuoy](https://github.com/vmware-tanzu/sonobuoy) diagnostic tool.

# How to

## Write Bats tests

Create your own, or use pre-created `.bats` tests in `bats` folder.

## Generate custom plugin yaml

```
sonobuoy gen plugin \
--name=example-bats \
--image jojojojo1234/bats-runner:0.1 \
--arg="./example1.bats" \
--arg="./example2.bats" > example-bats.yaml
```

**Note:** you can select which Bats to run. Bats to run are in `bats` folder. 
If you create new `.bats` file/s in `bats` folder make sure you build new `bats-runner` Docker image (`docker build -t bats-runner .`) and [reference it](#generate-custom-plugin-yaml) in `sonobuoy gen plugin` command afterwards.

## Run Sonobuoy with custom plugin

```
sonobuoy run --plugin example-bats.yaml --wait
```

## Inspect output files

```
results=$(sonobuoy retrieve) && sonobuoy results $results
tar xzf $results -C ./
cat plugins/example-bats/results/global/out*
```

**Note:** Results are in [TAP format](http://testanything.org).