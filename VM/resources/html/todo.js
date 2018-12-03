
function insert_note(newnote, before)
{
    var note_element = document.createElement('div');
    note_element.className = 'ft_list_element';
    note_element.innerHTML = newnote;
    var ftlist = document.getElementById('ft_list');
    if (before === 0)
        ftlist.appendChild(note_element);
    else
        ftlist.insertBefore(note_element, ftlist.firstChild);
    save_notes();
}

function add_note()
{
    var add = document.getElementById("btn");
    add.addEventListener("click", function (){
        var newnote = window.prompt("Add a new note");
        if (newnote !== '' && newnote !== null)
            insert_note(newnote, 1);
    });
}

function remove_note(element){
    var ans = confirm("You are about to delete a note, are you sure?")
    if (ans){
        element.remove();
        save_notes();
    }
}

function listen_clicknote(e)
{
    if(e.target.className === 'ft_list_element'){
        remove_note(e.target);
    }
}

function save_notes(){
    var elts = Array.from(document.getElementsByClassName('ft_list_element'));
    var str = '';
    elts.forEach(function(note)
    {
        str = str + note.innerHTML + "///";
    });
    document.cookie = "todolist=" + str;
}

function load_cookies()
{
    if (document.cookie)
    {
    var cook = document.cookie.split('todolist=');
    if (cook !== ''){
        var notes = cook[1].split(';');
        notes = notes[0].split("///");
        notes.forEach(function(note){
            if (note !== '')
                insert_note(note, 0);
        });
        }
    }
}