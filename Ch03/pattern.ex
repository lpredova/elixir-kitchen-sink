# pattern matcing
# pattern = term

{name, age} = {"Bob", 28}

{date, time} = :calendar.local_time

# {:ok, contents} = File.read("my_app.config")

{_, time} = :calendar.local_time

{_, {hour, _, _ }} = :calendar.local_time

expected_name = "Bob"
# Pin operator
{^expected_name, _} = {"Bob", 25}

[first,second, third] = [1,2,3]

[min|_] = Enum.sort([3,2,1])


%{name: name, age: age} = %{name: "Bob", age: 25}

%{age: age} = %{name: "Bob", age: 25}

sport_bob = %{name: "Bob", age: 25, works_at: "Sportening"}
%{works_at: works}= sport_bob

[_,{name, _},_] =[{"Bob",21},{"John",30},{"Donald",41}]

date_time_local = {_,{hour,_,_}} = :calendar.local_time


