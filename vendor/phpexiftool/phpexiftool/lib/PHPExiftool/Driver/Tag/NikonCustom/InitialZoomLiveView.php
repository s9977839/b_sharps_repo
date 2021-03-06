<?php

/*
 * This file is part of PHPExifTool.
 *
 * (c) 2012 Romain Neutron <imprec@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace PHPExiftool\Driver\Tag\NikonCustom;

use JMS\Serializer\Annotation\ExclusionPolicy;
use PHPExiftool\Driver\AbstractTag;

/**
 * @ExclusionPolicy("all")
 */
class InitialZoomLiveView extends AbstractTag
{

    protected $Id = '4.4';

    protected $Name = 'InitialZoomLiveView';

    protected $FullName = 'NikonCustom::SettingsD3';

    protected $GroupName = 'NikonCustom';

    protected $g0 = 'MakerNotes';

    protected $g1 = 'NikonCustom';

    protected $g2 = 'Camera';

    protected $Type = 'int8u';

    protected $Writable = true;

    protected $Description = 'Initial Zoom Live View';

    protected $flag_Permanent = true;

    protected $Values = array(
        0 => array(
            'Id' => 0,
            'Label' => 'Low Magnification',
        ),
        16 => array(
            'Id' => 16,
            'Label' => 'Medium Magnification',
        ),
        32 => array(
            'Id' => 32,
            'Label' => 'High Magnification',
        ),
    );

}
