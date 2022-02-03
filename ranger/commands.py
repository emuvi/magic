from ranger.api.commands import *

class shell(Command):
    escape_macros_for_shell = True

    def execute(self):
        if self.arg(1) and self.arg(1)[0] == '-':
            flags = self.arg(1)[1:]
            command = self.rest(2)
        else:
            flags = ''
            command = self.rest(1)
        
        command = '/usr/bin/fish'

        if command:
            self.fm.execute_command(command, flags=flags)

    def tab(self, tabnum):
        from ranger.ext.get_executables import get_executables
        if self.arg(1) and self.arg(1)[0] == '-':
            command = self.rest(2)
        else:
            command = self.rest(1)
        start = self.line[0:len(self.line) - len(command)]

        command = '/usr/bin/fish'

        try:
            position_of_last_space = command.rindex(" ")
        except ValueError:
            return (start + program + ' ' for program
                    in get_executables() if program.startswith(command))
        if position_of_last_space == len(command) - 1:
            selection = self.fm.thistab.get_selection()
            if len(selection) == 1:
                return self.line + selection[0].shell_escaped_basename + ' '
            return self.line + '%s '

        before_word, start_of_word = self.line.rsplit(' ', 1)
        return (before_word + ' ' + file.shell_escaped_basename
                for file in self.fm.thisdir.files or []
                if file.shell_escaped_basename.startswith(start_of_word))


