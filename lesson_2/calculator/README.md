# Walk-through: Refactoring Calculator
## Things to think about:
1. Is there a better way to validate that the user has input a number?
2. What if we needed to add some code after the case statement within the `operation_to_message` method?
3. There are lots of messages sprinkled throughout the program. Could we move them into some configuration file and access by key? This would allow us to manage the messages much easier, and we could even internationalize the messages. This is just a thought experiment, and no need to code this up.