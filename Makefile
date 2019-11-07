IMAGE_NAME="ray-tune-demo"
run:  
	cd $(dirname "$0")
	docker build -t=${IMAGE_NAME}  ./
	docker run -it --rm -p 6006:6006 ${IMAGE_NAME} 
startTuning:
	python ray_tune_demo/main.py
	tensorboard --logdir=./ray_results/exp --bind_all
