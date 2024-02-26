set +ex

for bs in 1 24
do
        for out in 128 1024
        do
        echo "run 1x Mixtral-8x7B inference with bs_${bs} prompt_128 output_${out}"

        python run_generation.py \
        --model_name_or_path mistralai/Mixtral-8x7B-v0.1 \
        --use_hpu_graphs \
        --use_kv_cache \
        --limit_hpu_graphs \
        --bucket_size 128 \
        --max_new_tokens ${out} \
        --bf16 \
        --batch_size ${bs} \
        --prompt "Hello my name is Katie and I am a 20 year old student from the UK. I am currently studying a degree in English Literature and Creative Writing at the University of Winchester. I have always had a passion for writing and I am hoping to pursue a career in journalism. I have a love for all things fashion, beauty and lifestyle related and I am hoping to share my thoughts and opinions with you all. I am also a huge fan of travelling and I am hoping to share my experiences with you. I am hoping to share my thoughts and opinions with you all. I am hoping to share my thoughts."
        # --prompt "Hello my name is"
        done
done