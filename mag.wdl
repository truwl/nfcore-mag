version 1.0

workflow mag {
	input{
		File samplesheet
		Boolean? single_end
		String outdir = "./results"
		String? email
		String? multiqc_title
		String igenomes_base = "s3://ngi-igenomes/igenomes"
		Boolean? igenomes_ignore
		String custom_config_version = "master"
		String custom_config_base = "https://raw.githubusercontent.com/nf-core/configs/master"
		String? hostnames
		String? config_profile_name
		String? config_profile_description
		String? config_profile_contact
		String? config_profile_url
		Int max_cpus = 16
		String max_memory = "128.GB"
		String max_time = "240.h"
		Boolean? help
		String publish_dir_mode = "copy"
		String? email_on_fail
		Boolean? plaintext_email
		String max_multiqc_email_size = "25.MB"
		Boolean? monochrome_logs
		String? multiqc_config
		String tracedir = "./results/pipeline_info"
		Boolean validate_params = true
		Boolean? show_hidden_params
		Boolean? enable_conda
		Boolean? singularity_pull_docker_container
		Boolean? megahit_fix_cpu_1
		Int spades_fix_cpus = -1
		Int spadeshybrid_fix_cpus = -1
		Int metabat_rng_seed = 1
		Boolean? save_trimmed_fail
		Int fastp_qualified_quality = 15
		Int fastp_cut_mean_quality = 15
		String? host_genome
		String? host_fasta
		Boolean? host_removal_verysensitive
		Boolean? host_removal_save_ids
		Boolean? keep_phix
		String phix_reference = "${baseDir}/assets/data/GCA_002596845.1_ASM259684v1_genomic.fna.gz"
		Boolean? skip_adapter_trimming
		Int longreads_min_length = 1000
		Int longreads_keep_percent = 90
		Int longreads_length_weight = 10
		Boolean? keep_lambda
		String lambda_reference = "${baseDir}/assets/data/GCA_000840245.1_ViralProj14204_genomic.fna.gz"
		String? centrifuge_db
		String? kraken2_db
		Boolean? skip_krona
		String? cat_db
		Boolean? cat_db_generate
		Boolean? save_cat_db
		String gtdb = "https://data.gtdb.ecogenomic.org/releases/release202/202.0/auxillary_files/gtdbtk_r202_data.tar.gz"
		Float gtdbtk_min_completeness = 50
		Float gtdbtk_max_contamination = 10
		Float gtdbtk_min_perc_aa = 10
		Float gtdbtk_min_af = 0.65
		Float gtdbtk_pplacer_cpus = 1
		Boolean gtdbtk_pplacer_scratch = true
		Boolean? coassemble_group
		String? spades_options
		String? megahit_options
		Boolean? skip_spades
		Boolean? skip_spadeshybrid
		Boolean? skip_megahit
		Boolean? skip_quast
		Boolean? skip_prodigal
		String binning_map_mode = "group"
		Boolean? skip_binning
		Int min_contig_size = 1500
		Int min_length_unbinned_contigs = 1000000
		Int max_unbinned_contigs = 100
		Boolean? skip_prokka
		Boolean? skip_busco
		String? busco_reference
		String? busco_download_path
		Boolean? busco_auto_lineage_prok
		Boolean? save_busco_reference

	}

	call make_uuid as mkuuid {}
	call touch_uuid as thuuid {
		input:
			outputbucket = mkuuid.uuid
	}
	call run_nfcoretask as nfcoretask {
		input:
			samplesheet = samplesheet,
			single_end = single_end,
			outdir = outdir,
			email = email,
			multiqc_title = multiqc_title,
			igenomes_base = igenomes_base,
			igenomes_ignore = igenomes_ignore,
			custom_config_version = custom_config_version,
			custom_config_base = custom_config_base,
			hostnames = hostnames,
			config_profile_name = config_profile_name,
			config_profile_description = config_profile_description,
			config_profile_contact = config_profile_contact,
			config_profile_url = config_profile_url,
			max_cpus = max_cpus,
			max_memory = max_memory,
			max_time = max_time,
			help = help,
			publish_dir_mode = publish_dir_mode,
			email_on_fail = email_on_fail,
			plaintext_email = plaintext_email,
			max_multiqc_email_size = max_multiqc_email_size,
			monochrome_logs = monochrome_logs,
			multiqc_config = multiqc_config,
			tracedir = tracedir,
			validate_params = validate_params,
			show_hidden_params = show_hidden_params,
			enable_conda = enable_conda,
			singularity_pull_docker_container = singularity_pull_docker_container,
			megahit_fix_cpu_1 = megahit_fix_cpu_1,
			spades_fix_cpus = spades_fix_cpus,
			spadeshybrid_fix_cpus = spadeshybrid_fix_cpus,
			metabat_rng_seed = metabat_rng_seed,
			save_trimmed_fail = save_trimmed_fail,
			fastp_qualified_quality = fastp_qualified_quality,
			fastp_cut_mean_quality = fastp_cut_mean_quality,
			host_genome = host_genome,
			host_fasta = host_fasta,
			host_removal_verysensitive = host_removal_verysensitive,
			host_removal_save_ids = host_removal_save_ids,
			keep_phix = keep_phix,
			phix_reference = phix_reference,
			skip_adapter_trimming = skip_adapter_trimming,
			longreads_min_length = longreads_min_length,
			longreads_keep_percent = longreads_keep_percent,
			longreads_length_weight = longreads_length_weight,
			keep_lambda = keep_lambda,
			lambda_reference = lambda_reference,
			centrifuge_db = centrifuge_db,
			kraken2_db = kraken2_db,
			skip_krona = skip_krona,
			cat_db = cat_db,
			cat_db_generate = cat_db_generate,
			save_cat_db = save_cat_db,
			gtdb = gtdb,
			gtdbtk_min_completeness = gtdbtk_min_completeness,
			gtdbtk_max_contamination = gtdbtk_max_contamination,
			gtdbtk_min_perc_aa = gtdbtk_min_perc_aa,
			gtdbtk_min_af = gtdbtk_min_af,
			gtdbtk_pplacer_cpus = gtdbtk_pplacer_cpus,
			gtdbtk_pplacer_scratch = gtdbtk_pplacer_scratch,
			coassemble_group = coassemble_group,
			spades_options = spades_options,
			megahit_options = megahit_options,
			skip_spades = skip_spades,
			skip_spadeshybrid = skip_spadeshybrid,
			skip_megahit = skip_megahit,
			skip_quast = skip_quast,
			skip_prodigal = skip_prodigal,
			binning_map_mode = binning_map_mode,
			skip_binning = skip_binning,
			min_contig_size = min_contig_size,
			min_length_unbinned_contigs = min_length_unbinned_contigs,
			max_unbinned_contigs = max_unbinned_contigs,
			skip_prokka = skip_prokka,
			skip_busco = skip_busco,
			busco_reference = busco_reference,
			busco_download_path = busco_download_path,
			busco_auto_lineage_prok = busco_auto_lineage_prok,
			save_busco_reference = save_busco_reference,
			outputbucket = thuuid.touchedbucket
            }
		output {
			Array[File] results = nfcoretask.results
		}
	}
task make_uuid {
	meta {
		volatile: true
}

command <<<
        python <<CODE
        import uuid
        print("gs://truwl-internal-inputs/nf-mag/{}".format(str(uuid.uuid4())))
        CODE
>>>

  output {
    String uuid = read_string(stdout())
  }
  
  runtime {
    docker: "python:3.8.12-buster"
  }
}

task touch_uuid {
    input {
        String outputbucket
    }

    command <<<
        echo "sentinel" > sentinelfile
        gsutil cp sentinelfile ~{outputbucket}/sentinelfile
    >>>

    output {
        String touchedbucket = outputbucket
    }

    runtime {
        docker: "google/cloud-sdk:latest"
    }
}

task fetch_results {
    input {
        String outputbucket
        File execution_trace
    }
    command <<<
        cat ~{execution_trace}
        echo ~{outputbucket}
        mkdir -p ./resultsdir
        gsutil cp -R ~{outputbucket} ./resultsdir
    >>>
    output {
        Array[File] results = glob("resultsdir/*")
    }
    runtime {
        docker: "google/cloud-sdk:latest"
    }
}

task run_nfcoretask {
    input {
        String outputbucket
		File samplesheet
		Boolean? single_end
		String outdir = "./results"
		String? email
		String? multiqc_title
		String igenomes_base = "s3://ngi-igenomes/igenomes"
		Boolean? igenomes_ignore
		String custom_config_version = "master"
		String custom_config_base = "https://raw.githubusercontent.com/nf-core/configs/master"
		String? hostnames
		String? config_profile_name
		String? config_profile_description
		String? config_profile_contact
		String? config_profile_url
		Int max_cpus = 16
		String max_memory = "128.GB"
		String max_time = "240.h"
		Boolean? help
		String publish_dir_mode = "copy"
		String? email_on_fail
		Boolean? plaintext_email
		String max_multiqc_email_size = "25.MB"
		Boolean? monochrome_logs
		String? multiqc_config
		String tracedir = "./results/pipeline_info"
		Boolean validate_params = true
		Boolean? show_hidden_params
		Boolean? enable_conda
		Boolean? singularity_pull_docker_container
		Boolean? megahit_fix_cpu_1
		Int spades_fix_cpus = -1
		Int spadeshybrid_fix_cpus = -1
		Int metabat_rng_seed = 1
		Boolean? save_trimmed_fail
		Int fastp_qualified_quality = 15
		Int fastp_cut_mean_quality = 15
		String? host_genome
		String? host_fasta
		Boolean? host_removal_verysensitive
		Boolean? host_removal_save_ids
		Boolean? keep_phix
		String phix_reference = "${baseDir}/assets/data/GCA_002596845.1_ASM259684v1_genomic.fna.gz"
		Boolean? skip_adapter_trimming
		Int longreads_min_length = 1000
		Int longreads_keep_percent = 90
		Int longreads_length_weight = 10
		Boolean? keep_lambda
		String lambda_reference = "${baseDir}/assets/data/GCA_000840245.1_ViralProj14204_genomic.fna.gz"
		String? centrifuge_db
		String? kraken2_db
		Boolean? skip_krona
		String? cat_db
		Boolean? cat_db_generate
		Boolean? save_cat_db
		String gtdb = "https://data.gtdb.ecogenomic.org/releases/release202/202.0/auxillary_files/gtdbtk_r202_data.tar.gz"
		Float gtdbtk_min_completeness = 50
		Float gtdbtk_max_contamination = 10
		Float gtdbtk_min_perc_aa = 10
		Float gtdbtk_min_af = 0.65
		Float gtdbtk_pplacer_cpus = 1
		Boolean gtdbtk_pplacer_scratch = true
		Boolean? coassemble_group
		String? spades_options
		String? megahit_options
		Boolean? skip_spades
		Boolean? skip_spadeshybrid
		Boolean? skip_megahit
		Boolean? skip_quast
		Boolean? skip_prodigal
		String binning_map_mode = "group"
		Boolean? skip_binning
		Int min_contig_size = 1500
		Int min_length_unbinned_contigs = 1000000
		Int max_unbinned_contigs = 100
		Boolean? skip_prokka
		Boolean? skip_busco
		String? busco_reference
		String? busco_download_path
		Boolean? busco_auto_lineage_prok
		Boolean? save_busco_reference

	}
	command <<<
		export NXF_VER=21.10.5
		export NXF_MODE=google
		echo ~{outputbucket}
		/nextflow -c /truwl.nf.config run /mag-2.1.1  -profile truwl,nfcore-mag  --input ~{samplesheet} 	~{"--samplesheet '" + samplesheet + "'"}	~{true="--single_end  " false="" single_end}	~{"--outdir '" + outdir + "'"}	~{"--email '" + email + "'"}	~{"--multiqc_title '" + multiqc_title + "'"}	~{"--igenomes_base '" + igenomes_base + "'"}	~{true="--igenomes_ignore  " false="" igenomes_ignore}	~{"--custom_config_version '" + custom_config_version + "'"}	~{"--custom_config_base '" + custom_config_base + "'"}	~{"--hostnames '" + hostnames + "'"}	~{"--config_profile_name '" + config_profile_name + "'"}	~{"--config_profile_description '" + config_profile_description + "'"}	~{"--config_profile_contact '" + config_profile_contact + "'"}	~{"--config_profile_url '" + config_profile_url + "'"}	~{"--max_cpus " + max_cpus}	~{"--max_memory '" + max_memory + "'"}	~{"--max_time '" + max_time + "'"}	~{true="--help  " false="" help}	~{"--publish_dir_mode '" + publish_dir_mode + "'"}	~{"--email_on_fail '" + email_on_fail + "'"}	~{true="--plaintext_email  " false="" plaintext_email}	~{"--max_multiqc_email_size '" + max_multiqc_email_size + "'"}	~{true="--monochrome_logs  " false="" monochrome_logs}	~{"--multiqc_config '" + multiqc_config + "'"}	~{"--tracedir '" + tracedir + "'"}	~{true="--validate_params  " false="" validate_params}	~{true="--show_hidden_params  " false="" show_hidden_params}	~{true="--enable_conda  " false="" enable_conda}	~{true="--singularity_pull_docker_container  " false="" singularity_pull_docker_container}	~{true="--megahit_fix_cpu_1  " false="" megahit_fix_cpu_1}	~{"--spades_fix_cpus " + spades_fix_cpus}	~{"--spadeshybrid_fix_cpus " + spadeshybrid_fix_cpus}	~{"--metabat_rng_seed " + metabat_rng_seed}	~{true="--save_trimmed_fail  " false="" save_trimmed_fail}	~{"--fastp_qualified_quality " + fastp_qualified_quality}	~{"--fastp_cut_mean_quality " + fastp_cut_mean_quality}	~{"--host_genome '" + host_genome + "'"}	~{"--host_fasta '" + host_fasta + "'"}	~{true="--host_removal_verysensitive  " false="" host_removal_verysensitive}	~{true="--host_removal_save_ids  " false="" host_removal_save_ids}	~{true="--keep_phix  " false="" keep_phix}	~{"--phix_reference '" + phix_reference + "'"}	~{true="--skip_adapter_trimming  " false="" skip_adapter_trimming}	~{"--longreads_min_length " + longreads_min_length}	~{"--longreads_keep_percent " + longreads_keep_percent}	~{"--longreads_length_weight " + longreads_length_weight}	~{true="--keep_lambda  " false="" keep_lambda}	~{"--lambda_reference '" + lambda_reference + "'"}	~{"--centrifuge_db '" + centrifuge_db + "'"}	~{"--kraken2_db '" + kraken2_db + "'"}	~{true="--skip_krona  " false="" skip_krona}	~{"--cat_db '" + cat_db + "'"}	~{true="--cat_db_generate  " false="" cat_db_generate}	~{true="--save_cat_db  " false="" save_cat_db}	~{"--gtdb '" + gtdb + "'"}	~{"--gtdbtk_min_completeness " + gtdbtk_min_completeness}	~{"--gtdbtk_max_contamination " + gtdbtk_max_contamination}	~{"--gtdbtk_min_perc_aa " + gtdbtk_min_perc_aa}	~{"--gtdbtk_min_af " + gtdbtk_min_af}	~{"--gtdbtk_pplacer_cpus " + gtdbtk_pplacer_cpus}	~{true="--gtdbtk_pplacer_scratch  " false="" gtdbtk_pplacer_scratch}	~{true="--coassemble_group  " false="" coassemble_group}	~{"--spades_options '" + spades_options + "'"}	~{"--megahit_options '" + megahit_options + "'"}	~{true="--skip_spades  " false="" skip_spades}	~{true="--skip_spadeshybrid  " false="" skip_spadeshybrid}	~{true="--skip_megahit  " false="" skip_megahit}	~{true="--skip_quast  " false="" skip_quast}	~{true="--skip_prodigal  " false="" skip_prodigal}	~{"--binning_map_mode '" + binning_map_mode + "'"}	~{true="--skip_binning  " false="" skip_binning}	~{"--min_contig_size " + min_contig_size}	~{"--min_length_unbinned_contigs " + min_length_unbinned_contigs}	~{"--max_unbinned_contigs " + max_unbinned_contigs}	~{true="--skip_prokka  " false="" skip_prokka}	~{true="--skip_busco  " false="" skip_busco}	~{"--busco_reference '" + busco_reference + "'"}	~{"--busco_download_path '" + busco_download_path + "'"}	~{true="--busco_auto_lineage_prok  " false="" busco_auto_lineage_prok}	~{true="--save_busco_reference  " false="" save_busco_reference}	-w ~{outputbucket}
	>>>
        
    output {
        File execution_trace = "pipeline_execution_trace.txt"
        Array[File] results = glob("results/*/*html")
    }
    runtime {
        docker: "truwl/nfcore-mag:2.1.1_0.1.0"
        memory: "2 GB"
        cpu: 1
    }
}
    