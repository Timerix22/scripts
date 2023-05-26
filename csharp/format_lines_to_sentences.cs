// transforms lines to sentences starting from capital letters

string? input_str;
bool first_line=true;
bool prev_sentence_ended=true;
while( (input_str=Console.ReadLine()) != null){
    if(input_str.Length==0)
        continue;
    char[] input_line=input_str.ToCharArray();

    if(first_line) first_line=false;
    else Console.Write(' ');

    if(prev_sentence_ended)
        input_line[0]=Char.ToUpper(input_line[0]);
    string out_str=new string(input_line);
    Console.Write(out_str);

    char last_char=input_line[^1];
    prev_sentence_ended= last_char!=',' && last_char!=';' && last_char!=':';
    if(prev_sentence_ended && last_char!='.' && last_char!='?' && last_char!='!')
        Console.Write('.');
}
Console.Write('\n');
