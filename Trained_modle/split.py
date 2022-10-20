import splitfolders

input_folder = "Dzo_MNIST"

splitfolders.ratio(input_folder, output="mnist",
ratio=(.8,.2))