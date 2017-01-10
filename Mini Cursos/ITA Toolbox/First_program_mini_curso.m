function varargout = First_program_mini_curso(varargin)
% FIRST_PROGRAM_MINI_CURSO MATLAB code for First_program_mini_curso.fig
%      FIRST_PROGRAM_MINI_CURSO, by itself, creates a new FIRST_PROGRAM_MINI_CURSO or raises the existing
%      singleton*.
%
%      H = FIRST_PROGRAM_MINI_CURSO returns the handle to a new FIRST_PROGRAM_MINI_CURSO or the handle to
%      the existing singleton*.
%
%      FIRST_PROGRAM_MINI_CURSO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRST_PROGRAM_MINI_CURSO.M with the given input arguments.
%
%      FIRST_PROGRAM_MINI_CURSO('Property','Value',...) creates a new FIRST_PROGRAM_MINI_CURSO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before First_program_mini_curso_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to First_program_mini_curso_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help First_program_mini_curso

% Last Modified by GUIDE v2.5 05-Nov-2016 00:36:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @First_program_mini_curso_OpeningFcn, ...
                   'gui_OutputFcn',  @First_program_mini_curso_OutputFcn, ...
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


% --- Executes just before First_program_mini_curso is made visible.
function First_program_mini_curso_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to First_program_mini_curso (see VARARGIN)

% Choose default command line output for First_program_mini_curso
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes First_program_mini_curso wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = First_program_mini_curso_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PB_plot.
function PB_plot_Callback(hObject, eventdata, handles)
% hObject    handle to PB_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tmin = str2double(get(handles.ET_tempoInicial,'String'));
tmax = get(handles.ET_tempoMax,'String');
tmax = str2double(tmax);

t = linspace(tmin,tmax,1000);
f = 5;

is_manual = 0; 
RB_string = get(handles.BG_plot,'SelectedObject');
RB_string = get(RB_string,'String'); if strcmp(RB_string,'Manual') is_manual = 1; end 

if is_manual
    Manual_operation = get(handles.ET_plotManual,'String');
    Plot_data = eval(Manual_operation);
    Titulo = 'Custom plot';
else
    
    Tipo_de_plot = get(handles.PM_plots,'Value');
    switch Tipo_de_plot
        case 1 % Seno
            Plot_data = sin(2*pi*t*f);
            Titulo = 'Seno';
        case 2 % Cosseno
            Plot_data = cos(2*pi*t*f);
            Titulo = 'Cosseno';
        case 3 % Linear
            Plot_data = t;
            Titulo = 'Linear';
        case 4 % Quadratico
            Plot_data = t.^2;
            Titulo = 'Quadratico';
        case 5 % Cúbio
            Plot_data = t.^3;
            Titulo = 'Cúbico';
        case 6 % Exponencial
            Plot_data = exp(t);
            Titulo = 'Exponencial';
    end
    
end


is_hold = get(handles.CB_hold,'Value');

if is_hold
    hold on
else
    hold off
end

plot(t,Plot_data) 
title(Titulo)
xlabel('t')
ylabel('Amplitude')


handles.Dados_tabela = horzcat(t',Plot_data');
set(handles.TB_result,'Data',handles.Dados_tabela)

guidata(hObject,handles)



% --- Executes on button press in PB_plot2.
function PB_plot2_Callback(hObject, eventdata, handles)
% hObject    handle to PB_plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = linspace(0,2,1000);
f = 5;
sine = cos(2*pi*t*f);

plot(t,sine)
title('Coseno')
xlabel('t')
ylabel('Amplitude')



function ET_tempoMax_Callback(hObject, eventdata, handles)
% hObject    handle to ET_tempoMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_tempoMax as text
%        str2double(get(hObject,'String')) returns contents of ET_tempoMax as a double


% --- Executes during object creation, after setting all properties.
function ET_tempoMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_tempoMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_tempoInicial_Callback(hObject, eventdata, handles)
% hObject    handle to ET_tempoInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_tempoInicial as text
%        str2double(get(hObject,'String')) returns contents of ET_tempoInicial as a double


% --- Executes during object creation, after setting all properties.
function ET_tempoInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_tempoInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PM_plots.
function PM_plots_Callback(hObject, eventdata, handles)
% hObject    handle to PM_plots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PM_plots contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PM_plots


% --- Executes during object creation, after setting all properties.
function PM_plots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PM_plots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_plotManual_Callback(hObject, eventdata, handles)
% hObject    handle to ET_plotManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_plotManual as text
%        str2double(get(hObject,'String')) returns contents of ET_plotManual as a double


% --- Executes during object creation, after setting all properties.
function ET_plotManual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_plotManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CB_hold.
function CB_hold_Callback(hObject, eventdata, handles)
% hObject    handle to CB_hold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CB_hold


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[file,path] = uiputfile('animinit.xlsx','Salve o arquivo');
cd(path)
xlswrite(file,handles.Dados_tabela)
