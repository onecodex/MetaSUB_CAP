
rule annotate_with_microbe_directory:
    input:
        metaphlan2 = config['metaphlan2_taxonomy_profiling']['mpa']
    output:
        json = config['microbe_directory_annotate']['json']
    params:
        script = config['pipeline_dir'] + config['alpha_diversity_stats']['script'],
        db = config['pipeline_dir'] + config['microbe_directory_annotate']['db']
    run:
        cmd = '{params.script} '
        cmd += '{params.db} '
        cmd += getSample(input.metaphlan2)
        cmd += ' {input.metaphlan2} '
        cmd += ' > {output.json}'

        shell(cmd)