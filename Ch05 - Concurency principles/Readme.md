# Concurrency principles

By default, BEAM uses as many schedulers as there are CPU cores available. For exam- ple, on a quad-core machine, four schedulers are used

BEAM process - 1 to 2kb.

BEAM processes are completely isolated: they share no memory, and a crash of one process won’t take down other processes.


Running new process:
```bash
spawn(fn -> expression_1 ... expression_n
end)
```

It returns PID that we can use to communicate with other processes.


## Receive

To summarize, receive tries to find the first (oldest) message in the process mailbox that can be matched against any of the provided clauses. If such a message is found, the corresponding code is executed. Otherwise, receive waits for such a message for a specified amount of time, or indefinitely if the after clause isn’t provided.
