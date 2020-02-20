function interface(varargin)

p = inputParser;

p.addParameter('filename1','',@ischar);
p.addParameter('filename2','',@ischar);
p.addParameter('base1','',@ischar);
p.addParameter('base2','',@ischar);
p.addParameter('rozm_okna',12,@isnumeric);
p.addParameter('prog_bledu',4,@isnumeric);

parse(p,varargin{:})
x=0;


if (isempty(p.Results.filename1) &&  isempty(p.Results.filename2) &&  isempty(p.Results.base1) &&  isempty(p.Results.base2) )
    disp('No sequences to compare')
    return
end


if ( ~isempty(p.Results.base1) ||  ~isempty(p.Results.filename1) ||  ~isempty(p.Results.filename2)|| ~isempty(p.Results.base2)  )
    if( ~isempty(p.Results.base1))
        x=x+1;
    end
    if( ~isempty(p.Results.base2))
        x=x+1;
    end
    if( ~isempty(p.Results.filename1))
        x=x+1;
    end
    if( ~isempty(p.Results.filename2))
        x=x+1;
    end
    if x>2
        disp('Too many sequences inputs')
        return
    end
end

if ( ~isempty(p.Results.filename1) &&   ~isempty(p.Results.filename2))
    text=fileFasta(p.Results.filename1);
    text1=fileFasta(p.Results.filename2);
end

if ( ~isempty(p.Results.base1) &&   ~isempty(p.Results.base2))
    text=fetchFasta('5',p.Results.base1);
    text1=fetchFasta('5',p.Results.base2);
end

if ( ~isempty(p.Results.base1) &&   ~isempty(p.Results.filename1))
    text=fetchFasta('5',p.Results.base1);
    text1=fileFasta(p.Results.filename1);
end

if ( ~isempty(p.Results.base2) &&   ~isempty(p.Results.filename1))
    text=fetchFasta('5',p.Results.base2);
    text1=fileFasta(p.Results.filename1);
end

if ( ~isempty(p.Results.base1) &&   ~isempty(p.Results.filename2))
    text=fetchFasta('5',p.Results.base1);
    text1=fileFasta(p.Results.filename2);
end

if ( ~isempty(p.Results.base2) &&   ~isempty(p.Results.filename2))
    text=fetchFasta('5',p.Results.base2);
    text1=fileFasta(p.Results.filename2);
end


a1 = parseFasta(text);
a2 = parseFasta(text1);


dotplot(a1,a2,p.Results.rozm_okna,p.Results.prog_bledu)
end

%Czasowa z³o¿onoœæ obliczeniowa:
%32

%Przestrzenna z³o¿onoœæ obliczeniowa:
%12


