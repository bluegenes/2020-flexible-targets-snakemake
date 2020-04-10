"""
Author: N Tessa Pierce, UC Davis Lab for Data Intensive Biology
Run: snakemake --configfiles test3_config.yml
"""
# tiny snake example to demonstrate flexible file targets

# Set which workflow you want to run. Here, we enable A by default
# You can write a configfile that sets these values for different samples
A_workflow = config.get("run_A", True)
B_workflow = config.get("run_B", False)

default_samples = ["test1", "test2"]
SAMPLES = config.get("samples", default_samples )


# define outputs for each workflow. If running that workflow, 
# add those outputs to the output file list you pass to `rule all`
output_files = []

if A_workflow:
    A_files = expand("{sample}.A.out", sample=SAMPLES)
    output_files += A_files # add A_files into the output_files list
if B_workflow:
    B_files = expand("{sample}.B.out", sample=SAMPLES)
    output_files += B_files # add B_files into the output_files list
    

rule all:
    input: output_files


rule A:
    input: "{sample}.fq"
    output: "{sample}.A.out"
    shell:
        """
        touch {output}
        """

rule B:
    input: "{sample}.fq"
    output: "{sample}.B.out"
    shell:
        """
        touch {output}
        """
