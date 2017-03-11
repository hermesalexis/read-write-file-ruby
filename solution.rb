
def load_tasks(file)
	tasks_arrays = []
	tasks_hashes = []

	File.open(file, "r") do |f|
		f.each_line do |line|
	    tasks_arrays << line.delete("\n").split(",")
	  end
	  tasks_arrays.each do |record|
	  	tasks_hashes << {'id' => record[0].to_i, 'name' => record[1], 'done' => record[2] == "true" ? true : false}
	  end
	end
	tasks_hashes
end



def save_tasks(file, records)
	if File.exist?(file)
	   File.delete(file)
	end
	string = ""
	File.open(file, "w+") do |f|
	  records.each do |record|
	   f.write("#{record[:id].to_s},#{record[:name]},#{record[:done].to_s} \n")
	  end
	end 
end

save_tasks('tasks.txt', [
  { id: 1, name: "Hacer tareas", done: true },
  { id: 2, name: "Lavar ropa", done: false }
])