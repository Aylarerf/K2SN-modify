p:=257;
F:= GF(p);
ZZ:= IntegerRing();
w:= F!42;

tk0i0:=[];

for i:=0 to 65535 do
	z:=Intseq(i,2);
	for j:=#z to 16 do
		z:= Append(z,0);
	end for;
	//print z;
	temp :=[];
	for j:=0 to 15 do
		t := 0;
		for k1:=0 to 15 do
			t := t + w^(4*k1*(1+2*j))* z[k1+1];
		end for;
		temp:= Append(temp,t);
	end for;
	tk0i0 := Append(tk0i0,temp);
end for;

tk:=[];
for i:=1 to 65536 do
	temp := [];
	for j:=0 to 3 do
		t:= ZZ!tk0i0[i][4*j+1] + ZZ!tk0i0[i][4*j+2]*2^16 + ZZ!tk0i0[i][4*j+3]*2^32 + ZZ!tk0i0[i][4*j+4]*2^48;
		temp:= Append(temp,t);
	end for;
	tk:= Append(tk,temp);
end for;

print tk:Hex;
