function varargout = serial_gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @serial_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @serial_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);

if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before serial_gui is made visible.
function serial_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to serial_gui (see VARARGIN)

% Choose default command line output for serial_gui
handles.output = hObject;
set(handles.pushbutton1,'backgroundcolor','g');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes serial_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = serial_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in COM_Num.
%com��ѡ���ص�����
function COM_Num_Callback(hObject, eventdata, handles)
% hObject    handle to COM_Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns COM_Num contents as cell array
%        contents{get(hObject,'Value')} returns selected item from COM_Num

% --- Executes during object creation, after setting all properties.
function COM_Num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COM_Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in COM_Rate.
%com ������ѡ�񴰿�
function COM_Rate_Callback(hObject, eventdata, handles)
% hObject    handle to COM_Rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns COM_Rate contents as cell array
%        contents{get(hObject,'Value')} returns selected item from COM_Rate


% --- Executes during object creation, after setting all properties.
function COM_Rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COM_Rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
%����λѡ���
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
%ֹͣλѡ���
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
%�򿪴��ڰ�ť
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global scom;
global lenth;%�������ݳ���

global len;%��Ч����Ԫ�ظ���
len=512;
lenth=len*2+2;




%%
    delete(instrfindall);                                   % ɾ��
    get(hObject,'value');                                   % ��ȡ������������
    com_n = sprintf('COM%d',get(handles.COM_Num,'value'));   % ��ȡ���ڵĶ˿���
    rates=[9600 19200 38400 57600 115200];              % ��ȡ���ڵĲ�����
    baud_rate=rates(get(handles.COM_Rate,'value'));          % ��ȡ���ڵĲ�����

    %���Դ򿪴���
    if strcmp(get(gco,'string'),'�򿪴���')==1
        try
            pause(0.1);
            
            scom = serial(com_n);                                   % �������ڶ���                             
            set(scom,'BaudRate',baud_rate);                         % ���ò�����
            set(scom,'DataBits',8);                                 % ��������λ��
            set(scom,'StopBits',1);                                 % ����ֹͣλ
            set(scom,'InputBufferSize',65536);                       % ���ý��ջ���
            set(scom,'BytesAvailableFcnMode','byte');    %�����жϴ�����ʽ
            set(scom,'BytesAvailableFcnCount',lenth);       %���ջ�����ÿ�յ�N���ֽ�ʱ�������ص�����
            set(scom,'BytesAvailableFcn',{@my_callback_g,handles});   % �����жϻص�����
            set(scom,'TimeOut',0.2);                    %���ô�������дʱ��
            set(handles.figure1, 'UserData', scom);     % �����ڶ���ľ����Ϊ�û����ݣ����봰�ڶ���
            fopen(scom);%�򿪴���
            set(handles.pushbutton1,'backgroundcolor','r');
            set(hObject,'string','�رմ���');
        catch %�����ڴ�ʧ�ܣ���ʾ�����ڴ�ʧ�ܡ�
            msgbox('���ڴ�ʧ��','Error','error');
            set(hObject,'value',0);% ���𱾰�ť
            %return;
        end
        

    else
         try
            fclose(scom);
            delete(scom);
            clear scom;
            set(handles.pushbutton1,'backgroundcolor','g');
            set(hObject,'string','�򿪴���');
          catch %�����ڴ�ʧ�ܣ���ʾ�����ڴ�ʧ�ܡ�
             set(handles.pushbutton1,'backgroundcolor','g');
             set(hObject,'string','�򿪴���');
             %msgbox('�ر�ʧ��','Error','error');
             %set(hObject,'value',0);% ���𱾰�ť
             %clear;
          end
    end
    
             
    
%%



% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
