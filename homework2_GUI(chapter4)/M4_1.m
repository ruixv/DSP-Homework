function varargout = M4_1(varargin)
% M4_1 MATLAB code for M4_1.fig
%      M4_1, by itself, creates a new M4_1 or raises the existing
%      singleton*.
%
%      H = M4_1 returns the handle to a new M4_1 or the handle to
%      the existing singleton*.
%
%      M4_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M4_1.M with the given input arguments.
%
%      M4_1('Property','Value',...) creates a new M4_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M4_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M4_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M4_1

% Last Modified by GUIDE v2.5 01-May-2017 20:26:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M4_1_OpeningFcn, ...
                   'gui_OutputFcn',  @M4_1_OutputFcn, ...
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


% --- Executes just before M4_1 is made visible.
function M4_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M4_1 (see VARARGIN)
global k
k = get(handles.edit1,'String')
k = str2num(k)
% Choose default command line output for M4_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M4_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M4_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
M = k
R = 50;
d = rand(R,1)-0.5;      %噪音
m = 0:1:R-1;
s = 2*m.*(0.9.^m);      %规整信号
x  = s + d';            %加噪音信号
axes(handles.axes1)
plot(m,d,'r-',m,s,'b-',m,x,'g-')
xlabel('Time index n'); ylabel('Amplitude')
legend('d[n]','s[n]','x[n]');
% pause
b = ones(M,1)/M;            %为什么/M
y = filter(b,1,x);              %对filter函数的理解
axes(handles.axes2)
plot(m,s,'r-',m,y,'b--')
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
k = get(handles.edit1,'String')
k = str2num(k)