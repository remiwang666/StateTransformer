python run_simulation.py --test_type closed_loop_nonreactive_agents --data_path /cephfs/shared/nuplan-v1.1/test --map_path /cephfs/shared/nuplan-v1.1/maps --model_path /cephfs/zhanjh/ExplicitDiffusion_80_pred_x0_sigmoid_True_25/checkpoint-6600 --split_filter_yaml nuplan_simulation/test14_hard.yaml --max_scenario_num 10000 --batch_size 8 --device cuda --exp_folder Saturday_80_x0_sig --processes-repetition 8