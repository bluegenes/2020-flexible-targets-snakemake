# 2020-flexible-targets-snakemake

Run default workflow (workflow A):
`snakemake` 


Run non-default workflow (workflow B): `snakemake --configfiles test3_config.yml`

Modify parameters in the configfile to mix and match!

This is a tiny snakefile with a single rule per workflow, but this pattern should work for any number or rules and combinations, as long as the filenames produced by each rule are unique (and thus can be properly ordered by snakemake).
