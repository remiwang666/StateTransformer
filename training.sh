# for training with diffusion

export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7; python -m torch.distributed.run --nproc_per_node=8 --master_port 12345 runner.py --model_name pretrain-mixtral-small-diffusion --model_pretrain_name_or_path /cephfs/zhanjh/exp/MOE_aux/checkpoint-150000 --saved_dataset_folder /localssd/zhanjh/online_s6 --output_dir /cephfs/zhanjh/StrDiff_result --logging_dir /cephfs/zhanjh/StrDiff_result --run_name Small_Str_Diff_1 --num_train_epochs 50 --per_device_train_batch_size 32 --warmup_steps 50 --weight_decay 0.01 --logging_steps 100 --save_strategy steps --save_steps 3000 --dataloader_num_workers 24 --dataloader_drop_last True --save_total_limit 5 --do_train --task nuplan --remove_unused_columns False --do_eval --evaluation_strategy steps --eval_steps 9000 --per_device_eval_batch_size 8 --predict_yaw True --use_proposal 0 --selected_exponential_past True --mean_circular_loss True --raster_channels 34 --use_mission_goal False --raster_encoder_type vit --vit_intermediate_size 768 --lr_scheduler_type cosine --use_speed --use_key_points specified_backward --augment_index 5 --attn_implementation flash_attention_2 --sync_norm True --bf16 True --nuplan_sim_exp_root /localssd/zhanjh/online_s6 --nuplan_sim_data_path /localssd/zhanjh/online_s6/val --nuplan_sim_map_folder /localssd/zhanjh/online_s6/map --nuplan_sim_split_filter_yaml nuplan_simulation/val14_split.yaml --max_sim_samples 64 --inspect_kp_loss --num_local_experts 24 --num_experts_per_token 2 --router_aux_loss_coef 0.1 --overwrite_output_dir  --ddp_find_unused_parameters False

# for training with shared data
# export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7; python -m torch.distributed.run --nproc_per_node=8 --master_port 12345 runner.py --model_name pretrain-mixtral-small-diffusion --model_pretrain_name_or_path /cephfs/zhanjh/exp/MOE_aux/checkpoint-150000 --saved_dataset_folder /cephfs/shared/nuplan/online_s6 --output_dir /cephfs/zhanjh/StrDiff_result --logging_dir /cephfs/zhanjh/StrDiff_result --run_name Small_Str_Diff_1 --num_train_epochs 50 --per_device_train_batch_size 32 --warmup_steps 50 --weight_decay 0.01 --logging_steps 100 --save_strategy steps --save_steps 3000 --dataloader_num_workers 24 --dataloader_drop_last True --save_total_limit 5 --do_train --task nuplan --remove_unused_columns False --do_eval --evaluation_strategy steps --eval_steps 9000 --per_device_eval_batch_size 8 --predict_yaw True --use_proposal 0 --selected_exponential_past True --mean_circular_loss True --raster_channels 34 --use_mission_goal False --raster_encoder_type vit --vit_intermediate_size 768 --lr_scheduler_type cosine --use_speed --use_key_points specified_backward --augment_index 5 --attn_implementation flash_attention_2 --sync_norm True --bf16 True --nuplan_sim_exp_root /cephfs/shared/nuplan/online_s6 --nuplan_sim_data_path /cephfs/shared/nuplan/online_s6/val --nuplan_sim_map_folder /cephfs/shared/nuplan/online_s6/map --nuplan_sim_split_filter_yaml nuplan_simulation/val14_split.yaml --max_sim_samples 64 --inspect_kp_loss --num_local_experts 24 --num_experts_per_token 2 --router_aux_loss_coef 0.1 --overwrite_output_dir  --ddp_find_unused_parameters False
