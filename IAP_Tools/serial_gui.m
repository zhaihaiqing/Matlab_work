function varargout = serial_gui(varargin)
% SERIAL_GUI MATLAB code for serial_gui.fig
%      SERIAL_GUI, by itself, creates a new SERIAL_GUI or raises the existing
%      singleton*.
%
%      H = SERIAL_GUI returns the handle to a new SERIAL_GUI or the handle to
%      the existing singleton*.
%
%      SERIAL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIAL_GUI.M with the given input arguments.
%
%      SERIAL_GUI('Property','Value',...) creates a new SERIAL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before serial_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to serial_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help serial_gui

% Last Modified by GUIDE v2.5 17-Jun-2019 13:59:50

% Begin initialization code - DO NOT EDIT
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
%com口选择框回调函数
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
%com 波特率选择窗口
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
%数据位选择框
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
%停止位选择框
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
%打开串口按钮
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom;
global scom_open_flag;

%%
    delete(instrfindall);                                   % 删除
    get(hObject,'value');                                   % 获取串口设置属性
    com_n = sprintf('COM%d',get(handles.COM_Num,'value'));   % 获取串口的端口名
    rates=[9600 19200 38400 57600 115200];                        % 获取串口的波特率
    baud_rate=rates(get(handles.COM_Rate,'value'));          % 获取串口的波特率
    %odd_even=get(handles.jiaoyan, 'value');                % 获取奇偶校验
    %data_bits = 5 + get(handles.data_bit, 'value');        % 获取数据位
    %stop_bits = get(handles.stop_bit, 'value');            % 获取停止位
    set(handles.pushbutton3,'backgroundcolor','g');         %打开发送按钮
    %尝试打开串口
    if strcmp(get(gco,'string'),'打开串口')
        try
            pause(0.1);
            scom = serial(com_n);                                   % 创建串口对象                             
            set(scom,'BaudRate',baud_rate);                         % 设置波特率
            set(scom,'DataBits',8);                                 % 设置数据位数
            set(scom,'StopBits',1);                                 % 设置停止位
            set(scom,'InputBufferSize',4096);                       % 设置接收缓存
            set(scom,'BytesAvailableFcnMode','byte');    %设置中断触发方式
            set(scom,'BytesAvailableFcnCount',8);       %接收缓冲区每收到N个字节时，触发回调函数
            set(scom,'BytesAvailableFcn',{@my_callback,handles});   % 设置中断回调函数
            set(scom,'TimeOut',0.4);                    %设置串口最大读写时间
            set(handles.figure1, 'UserData', scom);     % 将串口对象的句柄作为用户数据，存入窗口对象
            fopen(scom);%打开串口
            scom_open_flag=1;
            set(handles.pushbutton1,'backgroundcolor','r');
            set(hObject,'string','关闭串口');
            
        catch %若串口打开失败，提示“串口打开失败”
            msgbox('串口打开失败','Error','error');
            scom_open_flag=0;
            set(hObject,'value',0);% 弹起本按钮
            return;
        end
    else%若关闭串口
        try
            fclose(scom);
            delete(scom);
            clear scom;
            scom_open_flag=0;
            set(handles.pushbutton1,'backgroundcolor','g');
            set(hObject,'string','打开串口');
        catch %若串口打开失败，提示“串口打开失败”
            set(handles.pushbutton1,'backgroundcolor','g');
            set(hObject,'string','打开串口');
            clear;
            return;
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
%function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%function axes1_DeleteFcn(hObject, eventdata, handles)
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit3.
function edit3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% %选择文件按钮回调函数
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global imagedata;

 %global data;

 R_hex=cell(1,0);         %创建1维元胞数组
 
%读取文件路径，以及文件内容
[filename,pathname]=uigetfile('.bin','选择镜像文件');%选择镜像文件
fpath=[pathname,filename];                          %获取镜像文件路径
set(handles.edit4,'string',(fpath));                %显示镜像文件路径
xbin=fopen(fpath,'rb');                             %读取该路径下的文件，支持.bin文件
[imagedata] = (fread(xbin,inf,'uchar'))';           %读取文件内容，并转换为行矩阵
imagedata_Bytes=length(imagedata);                   %获取文件内字节长度
imagedata_size=ceil(imagedata_Bytes/1024);          %获取文件大小，KB，取整
imagedata_Frame=ceil(imagedata_Bytes/256);          %
Row=ceil(imagedata_Bytes/16);                       %将其分行
Row_Y=mod(imagedata_Bytes,16);%最后一行余数
data=imagedata;
for i=1:1:(16-Row_Y)
    data(end+1)=0;          %补0，使之能整除
end
for r=1:1:Row
    S1=[dec2hex(data(1,(r-1)*16+1)),' '];
    S2=[dec2hex(data(1,(r-1)*16+2)),' '];
    S3=[dec2hex(data(1,(r-1)*16+3)),' '];
    S4=[dec2hex(data(1,(r-1)*16+4)),' '];
    S5=[dec2hex(data(1,(r-1)*16+5)),' '];
    S6=[dec2hex(data(1,(r-1)*16+6)),' '];
    S7=[dec2hex(data(1,(r-1)*16+7)),' '];
    S8=[dec2hex(data(1,(r-1)*16+8)),' '];
    S9=[dec2hex(data(1,(r-1)*16+9)),' '];
    S10=[dec2hex(data(1,(r-1)*16+10)),' '];
    S11=[dec2hex(data(1,(r-1)*16+11)),' '];
    S12=[dec2hex(data(1,(r-1)*16+12)),' '];
    S13=[dec2hex(data(1,(r-1)*16+13)),' '];
    S14=[dec2hex(data(1,(r-1)*16+14)),' '];
    S15=[dec2hex(data(1,(r-1)*16+15)),' '];
    S16=[dec2hex(data(1,(r-1)*16+16)),' '];
    S=[num2str(r),': ',S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16];
    R_hex=[R_hex,S];            %元胞数组，新数据不断叠加在原数据之后
end

S=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']; %增加一个空行，避免显示不全
R_hex=[R_hex,S];
set(handles.edit8,'string',R_hex);

% for i=1:1:imagedata_Bytes
%     
% end
% for i=1:1:16
%      S=[i_hex(1,1)];
%     DP_C=[DP_C,S];
% end

set(handles.edit12,'string',[num2str(imagedata_size),'KB']);
set(handles.edit13,'string',[num2str(imagedata_Bytes),'B']);
set(handles.edit16,'string',[num2str(imagedata_Frame)]);

%% %数据发送回调函数
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom;
global imagedata;
global Rx_Flag;
global DP_Info;
global scom_open_flag;
MTdata=imagedata;

if scom_open_flag==1
    
    %if strcmp(get(gco,'string'),'发送')
    
        DP_Info=cell(1,0);

        pause(0.1);
        addr=str2num(get(handles.edit14,'string'));
        set(handles.pushbutton3,'backgroundcolor','r');

        %%按照协议添加内容
        len=length(MTdata);%计算字节个数
        dataSpace=ceil(len/1024);%向上取整，计算占用空间
        dataFrame=ceil(len/256);%向上取整，计算数据包数量
        data_mod=mod(MTdata,256);    %计算末尾包长度
        pause(0.1);


        %第一步：
        %%主机发送握手信息
        Rx_Flag=1;
        senddata=[addr  37  68  102 136 170 255 255]
        fwrite(scom,senddata,'uint8');
        S=[' ',' '];
        DP_Info=[S,DP_Info]; 
        S=['->Step 1:Connect Device...',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %在edit3中展示元胞数组

        pause(1.5);
        %第二步
        %主机发送镜像文件信息
        tem1=bitshift(bitand(len,4278190080),-24);
        tem2=bitshift(bitand(len,16711680),-16);
        tem3=bitshift(bitand(len,65280),-8);
        tem4=bitand(len,255);
        tem5=bitshift(bitand(dataFrame,65280),-8);
        tem6=bitand(dataFrame,255);

        senddata=[addr  38  4  0 tem1 tem2 tem3 tem4 tem5 tem6 255 255]
        fwrite(scom,senddata,'uint8');
        S=['->Step 2:Send Image File Info...',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %在edit3中展示元胞数组
        
        t1=2*dataSpace/12;
        pause(t1);

        %第三步
        %主机发送镜像文件
        t=0.95;  %延时，写flash占用14ms,通信占272ms
        for ix=1:1:dataFrame-1
             pause(t);
             senddata(1,1)=addr;
             senddata(1,2)=39;
             senddata(1,3)=bitshift(bitand(ix,65280),-8);
             senddata(1,4)=bitand(ix,255);
             for j=1:1:256
                 senddata(1,4+j)=MTdata(1,(ix-1)*256+j);
             end
             senddata(1,261)=255;
             senddata(1,262)=255;
             fwrite(scom,senddata,'uint8');
             N=num2str(ix);
             S=['->Step 3:Send Image dataFrame:',N];
             DP_Info=[S,DP_Info]; 
             set(handles.edit15,'string',DP_Info);   %在edit3中展示元胞数组

        end
        pause(t);
        for ix=1:1:262
             senddata(1,ix)=0;
        end
         senddata(1,1)=addr;
         senddata(1,2)=39;
         senddata(1,3)=bitshift(bitand(dataFrame,65280),-8);
         senddata(1,4)=bitand(dataFrame,255);
         for j=1:1:(len-(dataFrame-1)*256)
            senddata(1,4+j)=MTdata(1,(dataFrame-1)*256+j);
         end
         senddata(1,261)=255;
         senddata(1,262)=255;
         fwrite(scom,senddata,'uint8');
         N=num2str(dataFrame);
         S=['->Step 3:Send Image dataFrame:',N];
         DP_Info=[S,DP_Info]; 
         set(handles.edit15,'string',DP_Info);   %在edit3中展示元胞数组

         set(handles.pushbutton3,'backgroundcolor','g');
end


function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom;
global DP_Info;
global scom_open_flag;

if scom_open_flag==1
    set(handles.pushbutton4,'backgroundcolor','r');
    addr=str2num(get(handles.edit14,'string'));
    senddata=[addr  35  68  102 136 170 255 255];
    fwrite(scom,senddata,'uint8');
    S=['->Step 0:Send Update Firmware Commend...',' '];
    DP_Info=[S,DP_Info]; 
    set(handles.edit15,'string',DP_Info);   %在edit3中展示元胞数组
    pause(0.2);
    set(handles.pushbutton4,'backgroundcolor','g');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom;
global DP_Info;
global scom_open_flag;

if scom_open_flag==1
    set(handles.pushbutton6,'backgroundcolor','r');
    
    addr=str2num(get(handles.edit14,'string'));
    senddata=[addr  09  51  85 119 153 255 255];
    fwrite(scom,senddata,'uint8');
    S=['-->>Send Reset Software Commend...',' '];
    DP_Info=[S,DP_Info]; 
    set(handles.edit15,'string',DP_Info);   %在edit3中展示元胞数组
    pause(0.2);
    set(handles.pushbutton6,'backgroundcolor','g');
end
