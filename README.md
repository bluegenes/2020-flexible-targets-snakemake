# 2020-flexible-targets-snakemake

Run default workflow (workflow A):
`snakemake` 


Run non-default workflow (workflow B): `snakemake --configfiles test3_config.yml`

Modify parameters in the configfile to mix and match!

This is a tiny snakefile with a single rule per workflow, but this pattern should work for any number or rules and combinations, as long as the filenames produced by each rule are unique (and thus can be properly ordered by snakemake).

If your snakefiles start getting really large, you can try splitting them into smaller subsets, and using either `include` or `subworkflows`. I tend to keep rules associated with a single tool in small snakefiles, and then include/exclude them as necessary. Here you could have two files `ruleA.rule`, `ruleB.rule`, and then include/exclude them in the `if` statement where we define `output_files` via `include: "/path/to/ruleA.rule"`, etc. See [snakemake modularization](https://snakemake.readthedocs.io/en/stable/snakefiles/modularization.html) for more.
