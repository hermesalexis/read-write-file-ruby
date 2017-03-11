
def load_tasks
	tasks_arrays = []
	tasks_hashes = []

	File.open("task.txt", "r") do |f|
		f.each_line do |line|
	    tasks_arrays << line.delete("\n").split(",")
	  end
	  tasks_arrays.each do |record|
	  	tasks_hashes << {'id' => record[0].to_i, 'name' => record[1], 'done' => record[2] == "true" ? true : false}
	  end
	end
	tasks_hashes
end


