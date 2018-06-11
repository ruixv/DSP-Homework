function varargout = M3_1(varargin)
% M3_1 MATLAB code for M3_1.fig
%      M3_1, by itself, creates a new M3_1 or raises the existing
%      singleton*.
%
%      H = M3_1 returns the handle to a new M3_1 or the handle to
%      the existing singleton*.
%
%      M3_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M3_1.M with the given input arguments.
%
%      M3_1('Property','Value',...) creates a new M3_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M3_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M3_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M3_1

% Last Modified by GUIDE v2.5 02-May-2017 23:17:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M3_1_OpeningFcn, ...
                   'gui_OutputFcn',  @M3_1_OutputFcn, ...
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


% --- Executes just before M3_1 is made visible.
function M3_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M3_1 (see VARARGIN)

% Choose default command line output for M3_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M3_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M3_1_OutputFcn(hObject, eventdata, handles) 
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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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
k = get(handles.edit2,'String')
k = str2num(k)
r = get(handles.edit1,'String')
r = str2num(r)
sita = get(handles.edit3,'String')
sita = str2num(sita)
c1 = -2*r*cos(sita)
c2 = r*r
num = 1
den = [1,c1,c2];
w = 0:pi/(k-1):pi;
h = freqz(num, den, w);
% yourInputText = get(handles.edit1,'String');
axes(handles.axes1)
% subplot(2,2,1)
plot(w/pi,real(h));grid
title('Real part')
xlabel('\omega/\pi'); ylabel('Amplitude')
% subplot(2,2,2)
axes(handles.axes2)
plot(w/pi,imag(h));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
% subplot(2,2,3)
axes(handles.axes3)
plot(w/pi,abs(h));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
% subplot(2,2,4)
axes(handles.axes4)
plot(w/pi,unwrap(angle(h)));grid        %»°œ‡Œª
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('M3_2.m');