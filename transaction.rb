def get_transactions_data

	transactions_block ||= []
	blank_transaction = Hash[from: "", to: "", what: "", qty: ""]

	loop do
		puts "" 
		puts "Enter your name for the new transaction"
		from = gets.chomp
		puts "" 
		puts "What do you want to send ?"
		what = gets.chomp
		puts "" 
		puts "How much quantity ?"
		qty  = gets.chomp
		puts "" 
		puts "Who do you want to send it to ?"
		to 	 = gets.chomp

		transaction = Hash[from: "#{from}", to: "#{to}", what: "#{what}", qty: "#{qty}"] ## hash es una variable que contiene una coleccion de datos
		transactions_block << transaction ## agrega una nueva transaccion al array

		puts ""
		puts "Do you want to remove a transaction? (y/n)"
		answer = gets.chomp
		if answer == "y"
			if transactions_block.length > 0

				puts "Which transaction do you want to remove?"
				transactions_block.each_with_index do |transaction, index|
					puts "#{index} - #{transaction}"
				end

				transaction_to_remove = gets.chomp.to_i
				transactions_block.delete_at(transaction_to_remove)
				puts "Transaction removed successfully"

				puts "All transactions:"
				transactions_block.each_with_index do |transaction, index|
					puts "#{index} - #{transaction}"
				end
			else
				puts "There are no transactions to remove"
			end
		end

		puts "" 
		puts "Do you want to make another transaction for this block ? (Y/n)"
		new_transaction = gets.chomp.downcase 

	
		if new_transaction == "y" 
			self
		else
			return transactions_block ## devuelve el array de hashes
			break
		end
	end
end

