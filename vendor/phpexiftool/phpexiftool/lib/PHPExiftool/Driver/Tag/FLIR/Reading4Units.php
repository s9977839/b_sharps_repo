<?php

/*
 * This file is part of PHPExifTool.
 *
 * (c) 2012 Romain Neutron <imprec@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace PHPExiftool\Driver\Tag\FLIR;

use JMS\Serializer\Annotation\ExclusionPolicy;
use PHPExiftool\Driver\AbstractTag;

/**
 * @ExclusionPolicy("all")
 */
class Reading4Units extends AbstractTag
{

    protected $Id = 326;

    protected $Name = 'Reading4Units';

    protected $FullName = 'FLIR::MeterLink';

    protected $GroupName = 'FLIR';

    protected $g0 = 'APP1';

    protected $g1 = 'FLIR';

    protected $g2 = 'Image';

    protected $Type = 'int8u';

    protected $Writable = false;

    protected $Description = 'Reading 4 Units';

    protected $Values = array(
        13 => array(
            'Id' => 13,
            'Label' => 'C',
        ),
        27 => array(
            'Id' => 27,
            'Label' => '%',
        ),
        29 => array(
            'Id' => 29,
            'Label' => 'rel',
        ),
        36 => array(
            'Id' => 36,
            'Label' => 'g/kg',
        ),
    );

}
