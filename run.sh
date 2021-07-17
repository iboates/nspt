#!/bin/bash

for input_image in images/input/*; do

    # Setup input image name & path
    filename="$(basename -- $input_image)"
    input_name="${filename%.*}"
    echo $input_name
    mkdir images/final_output/$input_name

    for style_folder in images/style/*; do

      # Setup style folder name & path
      filename="$(basename -- $style_folder)"
      style_name="${filename%.*}"
      echo $style_name

      python neural-style-pt/neural_style.py \
        -style_image $style_folder \
        -style_weight 1000 \
        -style_scale 1 \
        -content_image $input_image \
        -init random \
        -learning_rate 1 \
        -print_iter 50 \
        -save_iter 0 \
        -image_size 512 \
        -num_iterations 1000 \
        -model_file 'NSPT/checkpoints/nyud-fcn32s-color-heavy.pth' \
        -content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
        -style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1 \
        -optimizer lbfgs \
        -output_image 'images/output/A1.png' \
        -tv_weight 0.00001 \
        -original_colors 0 \
        -backend cudnn

      python neural-style-pt/neural_style.py \
       -style_image $style_folder \
       -style_weight 1000  \
       -style_scale 1  \
       -content_image $input_image \
       -content_weight 5  \
       -init image  \
       -init_image 'images/output/A1.png'  \
       -print_iter 50  \
       -save_iter 0  \
       -image_size 768  \
       -num_iterations 600  \
       -model_file 'NSPT/checkpoints/nyud-fcn32s-color-heavy.pth' \
       -content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1  \
       -style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1  \
       -optimizer lbfgs  \
       -output_image 'images/output/A2.png'  \
       -tv_weight 0  \
       -gpu 0  \
       -original_colors 0  \
       -backend cudnn

      python neural-style-pt/neural_style.py  \
       -style_image $style_folder \
       -style_weight 1000  \
       -style_scale 1  \
       -content_image $input_image \
       -content_weight 5  \
       -init image  \
       -init_image 'images/output/A2.png'  \
       -print_iter 50  \
       -save_iter 0  \
       -image_size 1024  \
       -num_iterations 1000  \
       -model_file 'NSPT/checkpoints/nyud-fcn32s-color-heavy.pth' \
       -content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1  \
       -style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1  \
       -optimizer lbfgs  \
       -output_image 'images/output/A3.png'  \
       -tv_weight 0.00001  \
       -gpu 0  \
       -original_colors 0  \
       -backend cudnn

     python neural-style-pt/neural_style.py  \
       -style_image $style_folder \
       -style_weight 40000  \
       -style_scale 1  \
       -content_image $input_image \
       -content_weight 5  \
       -init image  \
       -init_image 'images/output/A3.png'  \
       -print_iter 50  \
       -save_iter 0  \
       -image_size 1400  \
       -num_iterations 1000  \
       -model_file 'NSPT/checkpoints/nyud-fcn32s-color-heavy.pth' \
       -content_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1  \
       -style_layers relu1_1,relu2_1,relu3_1,relu4_1,relu5_1  \
       -optimizer lbfgs  \
       -output_image 'images/output/A4.png'  \
       -tv_weight 0  \
       -gpu 0  \
       -original_colors 0  \
       -backend cudnn

     python neural-style-pt/neural_style.py  \
       -style_image $style_folder \
       -style_weight 80000  \
       -style_scale 1  \
       -content_image $input_image \
       -content_weight 5  \
       -init image  \
       -init_image 'images/output/A4.png'  \
       -print_iter 50  \
       -save_iter 0  \
       -image_size 1400  \
       -num_iterations 1000  \
       -model_file 'NSPT/checkpoints/nyud-fcn32s-color-heavy.pth' \
       -content_layers relu1_1,relu1_2,relu2_1,relu2_2,relu3_1,relu3_2,relu3_3,relu3_4,relu4_1,relu4_2,relu4_3,relu4_4,relu5_1,relu5_2,relu5_3,relu5_4  \
       -style_layers relu1_1,relu1_2,relu2_1,relu2_2,relu3_1,relu3_2,relu3_3,relu3_4,relu4_1,relu4_2,relu4_3,relu4_4,relu5_1,relu5_2,relu5_3,relu5_4  \
       -optimizer lbfgs  \
       -output_image 'images/output/A5.png'  \
       -tv_weight 0  \
       -gpu 0  \
       -original_colors 0  \
       -backend cudnn

     python neural-style-pt/neural_style.py  \
       -style_image $style_folder \
       -style_weight 40000  \
       -style_scale 1  \
       -content_image $input_image \
       -content_weight 0  \
       -init image  \
       -init_image 'images/output/A5.png'  \
       -print_iter 50  \
       -save_iter 100  \
       -image_size 1800  \
       -num_iterations 200  \
       -model_file 'NSPT/checkpoints/nyud-fcn32s-color-heavy.pth' \
       -content_layers relu1_1,relu1_2  \
       -style_layers relu1_1,relu1_2  \
       -optimizer lbfgs  \
       -output_image 'images/output/A6.png'  \
       -tv_weight 0  \
       -gpu 0  \
       -original_colors 0  \
       -backend cudnn

      python neural-style-pt/neural_style.py  \
       -style_image $style_folder \
       -style_weight 40000  \
       -style_scale 1  \
       -content_image $input_image \
       -content_weight 15  \
       -init image  \
       -init_image 'images/output/A6.png'  \
       -learning_rate 1  \
       -print_iter 50  \
       -save_iter 100  \
       -image_size 3600  \
       -num_iterations 200  \
       -model_file 'NSPT/checkpoints/channel_pruning.pth'  \
       -optimizer adam  \
       -output_image 'images/output/A7.png'  \
       -tv_weight 0  \
       -original_colors 0  \
       -backend cudnn

      python neural-style-pt/neural_style.py  \
       -style_image $style_folder \
       -style_weight 1500  \
       -style_scale 0.5  \
       -content_image $input_image \
       -content_weight 0  \
       -init image  \
       -init_image 'images/output/A7.png'  \
       -learning_rate 1  \
       -print_iter 50  \
       -save_iter 0  \
       -image_size 7200  \
       -num_iterations 10  \
       -model_file 'NSPT/checkpoints/nin_imagenet.pth'  \
       -content_layers relu0,relu1  \
       -style_layers relu0,relu1  \
       -optimizer adam  \
       -output_image 'images/output/A8-FINAL.png'  \
       -tv_weight 0  \
       -original_colors 0  \
       -backend cudnn

     mkdir images/final_output/$input_name/$style_name
     mv images/output/* images/final_output/$input_name/$style_name


    done

done
