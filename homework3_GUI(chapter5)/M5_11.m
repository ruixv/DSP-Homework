function varargout = M5_11(varargin)
% M5_11 MATLAB code for M5_11.fig
%      M5_11, by itself, creates a new M5_11 or raises the existing
%      singleton*.
%
%      H = M5_11 returns the handle to a new M5_11 or the handle to
%      the existing singleton*.
%
%      M5_11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M5_11.M with the given input arguments.
%
%      M5_11('Property','Value',...) creates a new M5_11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M5_11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M5_11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M5_11

% Last Modified by GUIDE v2.5 08-May-2017 14:19:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M5_11_OpeningFcn, ...
                   'gui_OutputFcn',  @M5_11_OutputFcn, ...
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


% --- Executes just before M5_11 is made visible.
function M5_11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M5_11 (see VARARGIN)

% Choose default command line output for M5_11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M5_11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M5_11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R s x m
R = 50;
d = rand(R,1)-0.5;      %噪音
m = 0:1:R-1;
s = 2*m.*(0.9.^m);      %规整信号
x  = s + d';            %加噪音信号
axes(handles.axes1)
plot(m,d,'r-',m,s,'b-',m,x,'g-')
xlabel('Time index n'); ylabel('Amplitude')
legend('d[n]','s[n]','x[n]');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M x m s
M = get(handles.edit1,'String')
M = str2num(M)
b = ones(M,1)/M;            %为什么/M
y = filter(b,1,x);              %对filter函数的理解

axes(handles.axes3)
plot(m,s,'r-',m,y,'b--')
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global M x m s
M = get(handles.edit1,'String')
M = str2num(M)
b = ones(M,1)/M;            %为什么/M
y = conv_save(x,b); 
axes(handles.axes2)
% y(length(y)-1,:) = []
% y(length(y),:) = []
hold off
plot(1,1)
hold on
plot(m,s,'r-')
% legend('s[n]')
plot(y,'b--')
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
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
