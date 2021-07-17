#!/bin/bash

for input_image in images/input/*; do

    # Setup input image name & path
    filename="$(basename -- $input_image)"
    input_name="${filename%.*}"
    echo $input_name
    
#    mkdir images/final_output/$input_name

    for style_folder in images/style/*; do

      # Setup style folder name & path
      filename="$(basename -- $style_folder)"
      style_name="${filename%.*}"
      echo $style_name

      echo python neural-style-pt/neural_style.py \
        -style_image '$style_folder' \
        -style_weight 1000 \
        -style_scale 1 \
        -content_image '$input_image' \
        -init random \
        -learning_rate 1 \
        -print_iter 50 \
        -save_iter 250 \
        -image_size 512 \
        -num_iterations 1000 \
        -model_file 'NSPT/checkpoints/nyud-fcn32s-color-heavy.pth' \
        -content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
        -style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
        -optimizer lbfgs \
        -output_image 'output/A1.png' \
        -tv_weight 0.00001 \
        -original_colors 0 \
        -backend cudnn

    done

done
