function cohete(block)
% Si le cambian el nombre al archivo (que deberían cambiarlo) se debe cambiar también el nombre en la primera línea
setup(block);


% Lo que uno hace en el archivo es definir las características de las entradas,
% las salidas y los estados, así como escribir las ecuaciones del modelo.
%
function setup(block)

% Acá hay que decir cuántas entradas, salidas y estados hay:
block.NumInputPorts  = 1;
block.NumOutputPorts = 2;
block.NumContStates = 3;
% Setup port properties to be inherited or dynamic: esto se deja así
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

%Entradas:

%Tasa de consumo del combustible u_p
block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DatatypeID  = 0;  % double
block.InputPort(1).Complexity  = 'Real';
block.InputPort(1).DirectFeedthrough = false;

%Salidas:

%Altura h
block.OutputPort(1).Dimensions       = 1;
block.OutputPort(1).DatatypeID  = 0; % double
block.OutputPort(1).Complexity  = 'Real';
block.OutputPort(1).SamplingMode = 'Sample';

%Velocidad v
block.OutputPort(2).Dimensions       = 1;
block.OutputPort(2).DatatypeID  = 0; % double
block.OutputPort(2).Complexity  = 'Real';
block.OutputPort(2).SamplingMode = 'Sample';


% Acá uno pone el número de parámetros que va a recibir la S-function
block.NumDialogPrms     = 7;

% Acá se configura el tiempo de muestreo. Normalmente se deja así como está
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
block.SampleTimes = [0 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'CustomSimState',  < Has GetSimState and SetSimState methods
%    'DisallowSimState' < Error out when saving or restoring the model sim state
block.SimStateCompliance = 'DefaultSimState';

% -----------------------------------------------------------------
% The MATLAB S-function uses an internal registry for all
% block methods. You should register all relevant methods
% (optional and required) as illustrated below. You may choose
% any suitable name for the methods and implement these methods
% as local functions within the same file. See comments
% provided for each function for more information.
% -----------------------------------------------------------------

block.RegBlockMethod('InitializeConditions', @InitConditions); % Acá se inicializan los estados
block.RegBlockMethod('Outputs', @Outputs);     % Acá se calculan las salidas
block.RegBlockMethod('Derivatives', @Derivatives); %Acá se actualizan las derivadas
block.RegBlockMethod('Terminate', @Terminate); % Required
% -------------------- Esta parte de es necesaria, sólo si se tiene varias entradas y salidas -----------------
block.RegBlockMethod('SetInputPortSamplingMode',@SetInputPortSamplingMode);
block.RegBlockMethod('SetInputPortDimensions', @SetInpPortDims);


function SetInputPortSamplingMode(block, idx, fd)
block.InputPort(idx).SamplingMode = fd;

block.OutputPort(1).SamplingMode = fd;
block.OutputPort(2).SamplingMode = fd;



function SetInpPortDims(block, idx, di)
block.InputPort(idx).Dimensions = di;


function InitConditions(block) %Se inicializan los estados
%Altura inicial
block.ContStates.Data(1) = 0;
%Velocidad inicial
block.ContStates.Data(2) = 0;
%Masa inicial
block.ContStates.Data(3) = block.DialogPrm(7).Data;
 
  
function Outputs(block) % Cálculo de las salidas
h = block.ContStates.Data(1);
v = block.ContStates.Data(2);

%Condición altura mayor o igual a 0
if (h < 0)
   block.OutputPort(1).Data = 0;
   block.OutputPort(2).Data = 0;
else
    block.OutputPort(1).Data = h;
    block.OutputPort(2).Data = v;
end


function Derivatives(block) % Se calculan las derivadas
%Estados
h = block.ContStates.Data(1);
v = block.ContStates.Data(2);
mp = block.ContStates.Data(3);

%Parametros
ms = block.DialogPrm(1).Data;
g = block.DialogPrm(2).Data;
rho = block.DialogPrm(3).Data;
A = pi*(block.DialogPrm(4).Data)^2;
ve = block.DialogPrm(5).Data;
Cd = block.DialogPrm(6).Data;

%Condición masa del combustible mayor a 0
if mp > 0
    up = block.InputPort(1).Data;
else
    up = 0;
    block.ContStates.Data(3) = 0;
    mp = block.ContStates.Data(3);
end

%Derivada h
block.Derivatives.Data(1) = v;
%Derivada v
block.Derivatives.Data(2) = (-(ms+mp)*g + up*ve -(1/2)*rho*v*abs(v)*A*Cd)/(ms+mp);
%Derivada mp
block.Derivatives.Data(3) = -up;     


function Terminate(block) % Solo si se quiere hacer algo especial, cuando finaliza la S function, normalmente se deja en blanco

    