function varargout = M5_10(varargin)
% M5_10 MATLAB code for M5_10.fig
%      M5_10, by itself, creates a new M5_10 or raises the existing
%      singleton*.
%
%      H = M5_10 returns the handle to a new M5_10 or the handle to
%      the existing singleton*.
%
%      M5_10('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M5_10.M with the given input arguments.
%
%      M5_10('Property','Value',...) creates a new M5_10 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M5_10_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M5_10_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M5_10

% Last Modified by GUIDE v2.5 08-May-2017 14:08:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M5_10_OpeningFcn, ...
                   'gui_OutputFcn',  @M5_10_OutputFcn, ...
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


% --- Executes just before M5_10 is made visible.
function M5_10_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M5_10 (see VARARGIN)
global n x
n = 0:1:255
x = zeros(1,256)
% Choose default command line output for M5_10
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M5_10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M5_10_OutputFcn(hObject, eventdata, handles) 
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
global n x
for m = 0:1:255
    x(1,m+1) = 0.1*m*exp(-0.03*m)
end
axes(handles.axes1)
plot(n,x)
xlabel('n')
ylabel('x[n]')
title('原信号')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n noise
noise_fft = [zeros(1,50) 10*rand(1,156)-10 zeros(1,50)]       
noise = 5*(ifft(noise_fft,256))   %  利用随机数+ifft产生特定频率范围的随机信号
axes(handles.axes2)
plot(n,noise)
xlabel('n')
ylabel('noise')
title('高频噪音')
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n noise x y
y = noise + x
axes(handles.axes3)
plot(n,y)
xlabel('n')
ylabel('y[n]')
title('加入噪音的信号')
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n noise x y
z = fft(y,256)
for m = 50:1:206
    z(1,m) = 0          %滤波
end
recover = ifft(z,256)
axes(handles.axes4)
plot(n,recover)
xlabel('n')
ylabel('recover')
title('复原后的信号')
