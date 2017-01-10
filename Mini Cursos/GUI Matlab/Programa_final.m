function varargout = Programa_final(varargin)
% PROGRAMA_FINAL MATLAB code for Programa_final.fig
%      PROGRAMA_FINAL, by itself, creates a new PROGRAMA_FINAL or raises the existing
%      singleton*.
%
%      H = PROGRAMA_FINAL returns the handle to a new PROGRAMA_FINAL or the handle to
%      the existing singleton*.
%
%      PROGRAMA_FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAMA_FINAL.M with the given input arguments.
%
%      PROGRAMA_FINAL('Property','Value',...) creates a new PROGRAMA_FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Programa_final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Programa_final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Programa_final

% Last Modified by GUIDE v2.5 18-Nov-2016 09:12:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Programa_final_OpeningFcn, ...
                   'gui_OutputFcn',  @Programa_final_OutputFcn, ...
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


% --- Executes just before Programa_final is made visible.
function Programa_final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Programa_final (see VARARGIN)

% Choose default command line output for Programa_final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Programa_final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Programa_final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ET_alphas_Callback(hObject, eventdata, handles)
% hObject    handle to ET_alphas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_alphas as text
%        str2double(get(hObject,'String')) returns contents of ET_alphas as a double


% --- Executes during object creation, after setting all properties.
function ET_alphas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_alphas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Frequencies_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Frequencies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Frequencies as text
%        str2double(get(hObject,'String')) returns contents of ET_Frequencies as a double


% --- Executes during object creation, after setting all properties.
function ET_Frequencies_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Frequencies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_lx_Callback(hObject, eventdata, handles)
% hObject    handle to ET_lx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_lx as text
%        str2double(get(hObject,'String')) returns contents of ET_lx as a double


% --- Executes during object creation, after setting all properties.
function ET_lx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_lx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_ly_Callback(hObject, eventdata, handles)
% hObject    handle to ET_ly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_ly as text
%        str2double(get(hObject,'String')) returns contents of ET_ly as a double


% --- Executes during object creation, after setting all properties.
function ET_ly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_ly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_lz_Callback(hObject, eventdata, handles)
% hObject    handle to ET_lz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_lz as text
%        str2double(get(hObject,'String')) returns contents of ET_lz as a double


% --- Executes during object creation, after setting all properties.
function ET_lz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_lz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ME_save_Callback(hObject, eventdata, handles)
% hObject    handle to ME_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ME_calculate_Callback(hObject, eventdata, handles)
% hObject    handle to ME_calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Inputs
Lx = str2double(get(handles.ET_lx,'String'));
Ly = str2double(get(handles.ET_ly,'String'));
Lz = str2double(get(handles.ET_lz,'String'));

alphas = eval(get(handles.ET_alphas,'String'));
Frequencies = eval(get(handles.ET_Frequencies,'String'));

V = Lx*Ly*Lz;

A = Lx*Ly*2+Lx*Lz*2+Ly*Lz*2;

Algorithm = get(handles.BG_alg,'SelectedObject');
Algorithm = get(Algorithm,'String');

if strcmp(Algorithm,'Sabines')
    
        T = 0.163*V./(A*alphas);
        
else
    T = 0.163*V./(-A*log(1-alphas));
end

%Plot
axes(handles.axes1)
semilogx(Frequencies,T)
set(gca,'fontsize',10)
title(['Reverberation with ',Algorithm])
xlabel('Frequency')
ylabel('Time[s]')
set(gca,'Xtick',Frequencies,'Xticklabel',Frequencies)
xlim([Frequencies(1) Frequencies(end)])

axes(handles.axes2)
bar(T)
set(gca,'fontsize',10)
title(['Reverberation with ',Algorithm])
set(gca,'Xticklabel',Frequencies)
xlabel('Frequency')
ylabel('Time[s]')

%table
Data = vertcat(Frequencies,T);
set(handles.TB_result,'Data',Data)
