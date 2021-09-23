'''
This program creates the following Pushdown Automaton:
M=(K, S, G, d, q, z)
K={T}                  :Set of States
S{"A","Z"}             :Input Alphabet
G={K,B}                :Stack Alphabet
d={
d(T,K,"A") = push(I),
d(T,K,"Z") = pop(),
d(T,B,"A") = push(I)
}                      :Set of moves
q = T                  :Initial State
z = B                  :Initial Stack Symbol
'''
import time


def PushDownAutomaton(strInput, start_state="T", input_alphabet=("A", "Z"), stack_alphabet=("B", "K"), stack_symbol="B"):
    '''This automaton takes a string input an returns True if every for every A there exists exactly one Z
    further down the input string. It also prints a table of the current state.'''
    State = start_state  # Edw ithela na to kanw modular kai na dwsw dynatotita gia perissoteres katastaseis alla den eixe noima gia afti tin askisi
    Stack = [stack_symbol]
    global String
    String = strInput

    def convInput(inp):
        '''Converts input to a list'''
        a = []
        for s in inp:
            a.append(s)
        a.reverse()
        return a

    def push(item="K", target=Stack):
        '''Pushes K onto the list - Push(K)'''
        global String
        target.append(item)
        String = String[1:]
        return target

    def pop(target=Stack):
        '''Pop function for the stack.'''
        global String
        target.pop()
        String = String[1:]
        return target

    def moveAction(inp, state="T", stack=Stack):
        '''Handles move action as described by the set of moves [d] above.'''
        try:
            symbol = convInput(inp).pop()
            if state == "T" and Stack[len(Stack)-1] == "B" and symbol == "A":
                return push()
            elif state == "T" and Stack[len(Stack)-1] == "K" and symbol == "Z":
                return pop()
            elif state == "T" and Stack[len(Stack)-1] == "K" and symbol == "A":
                return push()
            else:
                return False
        except IndexError:
            return False

    def run(stri=String):
        def firstRow():
            print("Move    "+"Input    "+(L-3)*" "+"Stack   "+(int(L/2)-4)*" "+"State")

        def printRow():
            print(str(i)+(8-len(str(i)))*" "+String+" -|"+max((3+L-len(String)), 6-len(String))
                  * " "+s+max(10-len(s), (6+int(L/2)-len(s)))*" "+State)
        global String
        i = 1
        t = True
        L = len(String)
        firstRow()
        while String != "" and t:
            s = ""
            for l in Stack:
                s += l
            printRow()
            t = moveAction(String)
            time.sleep(0.5)
            i += 1
        if String == "" and len(Stack) == 1 and Stack[0] == "B":
            printRow()
            print("\nYES!\n")
        else:
            # printRow()
            print("\nNO!\n")
    run()


# Run
print('''This program creates the following Pushdown Automaton:
M=(K, S, G, d, q, z)
K={T}                  :Set of States
S{"A","Z"}             :Input Alphabet
G={K,B}                :Stack Alphabet
d={
d(T,K,"A") = push(I),
d(T,K,"Z") = pop(),
d(T,B,"A") = push(I)
}                      :Set of moves
q = T                  :Initial State
z = B                  :Initial Stack Symbol
''')
print('''This automaton takes a string input an prints "YES!"
if for every A there exists exactly one Z further
down the input string, otherwise it prints "NO!".
It also prints a table of the states up until it ends it's processing of the string.\n''')
while True:
    a = input("Give me a String of As and Zs to process!\n")
    PushDownAutomaton(a)

finish = input("Press any key to continue!")
